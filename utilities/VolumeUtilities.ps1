using namespace System.Collections.Generic

function Get-EncryptableVolumes {
    $encryptableVolumes = [List[EncryptableVolume]]::new()

    $drives = Get-CimInstance -Namespace "root\CIMv2\Security\MicrosoftVolumeEncryption" -Query "SELECT * FROM Win32_EncryptableVolume"
    foreach ($drive in $drives) {
        $encryptableVolumes.Add([EncryptableVolume]::new("$($drive.DeviceID)", "$($drive.DriveLetter)", "$($drive.PersistentVolumeID)"))
    }

    return $encryptableVolumes
}

function Get-EncryptedVolumes {
    $encryptedVolumes = [List[EncryptableVolume]]::new()

    $encDrives = Get-CimInstance -Namespace "root\CIMv2\Security\MicrosoftVolumeEncryption" -Query "SELECT * FROM Win32_EncryptableVolume WHERE ProtectionStatus > 0"
    foreach ($encDrive in $encDrives) {
        $encryptedVolumes.Add([EncryptableVolume]::new("$($encDrive.DeviceID)", "$($encDrive.DriveLetter)", "$($encDrive.PersistentVolumeID)"))
    }

    return $encryptedVolumes
}

function Get-EncryptedVolumeInstance {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID
    )
    
    try {
        return Get-CimInstance -Namespace "root\CIMv2\Security\MicrosoftVolumeEncryption" -Query "SELECT * FROM Win32_EncryptableVolume WHERE PersistentVolumeID = `"$PersistentVolumeID`"" -ErrorAction Stop
    } catch {
        return $null
    }
}

function Get-EncryptedVolumeInstanceByDeviceId {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $DeviceID
    )
    
    try {
        return Get-CimInstance -Namespace "root\CIMv2\Security\MicrosoftVolumeEncryption" -Query "SELECT * FROM Win32_EncryptableVolume WHERE DeviceID = `"$($DeviceID.Replace('\', '\\'))`"" -ErrorAction Stop
    } catch {
        return $null
    }
}

function Get-PersistentVolumeIDFromDeviceId {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $DeviceID
    )
    
    try {
        return (Get-CimInstance -Namespace "root\CIMv2\Security\MicrosoftVolumeEncryption" -Query "SELECT PersistentVolumeID FROM Win32_EncryptableVolume WHERE DeviceID = `"$($DeviceID.Replace('\', '\\'))`"" -ErrorAction Stop).PersistentVolumeID
    } catch {
        return ""
    }
}

function Get-VolumeKeyProtectors {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID,
        [Parameter(Position = 1)] [int] $ProtectorType = 0
    )
    
    $keyProtectors = [List[KeyProtector]]::new()
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstance -PersistentVolumeID "$PersistentVolumeID"
        if ($null -eq $encVolumeInstance) {
            return $keyProtectors
        }
        $keyProtectorResults = $encVolumeInstance | Invoke-CimMethod -MethodName "GetKeyProtectors" -Arguments @{KeyProtectorType = $ProtectorType} -ErrorAction Stop
        if ($null -eq $keyProtectorResults) {
            return $KeyProtectors
        }
        
        $keyProtectorIds = $keyProtectorResults.VolumeKeyProtectorID
        foreach ($keyProtectorId in $keyProtectorIds) {
            $keyProtector = $null
            try {
                $keyProtectorTypeResult = $encVolumeInstance | Invoke-CimMethod -MethodName "GetKeyProtectorType" -Arguments @{VolumeKeyProtectorID = "$keyProtectorId"} -ErrorAction Stop
                if (($null -eq $keyProtectorTypeResult) -or ($keyProtectorTypeResult.ReturnValue -ne 0)) {
                    throw
                }
                $keyProtectorType = $keyProtectorTypeResult.KeyProtectorType
                $keyProtector = [KeyProtector]::new("$keyProtectorId", $keyProtectorType)
            } catch {
                continue
            }
            $keyProtectors.Add($keyProtector)            
        }
    } catch {
        return $keyProtectors
    }
    
    return $keyProtectors
}

function Get-VolumeLockStatus {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID
    )
    
    $lockStatus = -1
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstance -PersistentVolumeID "$PersistentVolumeID"
        if ($null -eq $encVolumeInstance) {
            return $lockStatus
        }
        $lockStatusResults = $encVolumeInstance | Invoke-CimMethod -MethodName "GetLockStatus" -ErrorAction Stop
        if (($null -eq $lockStatusResults) -or ($lockStatusResults.ReturnValue -ne 0)) {
            throw
        }
        $lockStatus = $lockStatusResults.LockStatus
        
        return $lockStatus
    } catch {
        return $lockStatus
    }
}

function Test-NumericalPasswordFormat {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $NumericalPassword
    )
    
    # Test length
    if ($NumericalPassword.Length -ne 55) {
        return $false
    }
    
    # Test whether the password is fully numeric.
    $noDashPassword = $NumericalPassword.Replace("-", "")
    if (-not ($noDashPassword -match "^\d+$")) {
        return $false
    }
    
    # Test whether the modulo of 11 for the first 5 characters in each group returns the 6th character.
    $passwordParts = $NumericalPassword.Split("-")
    foreach ($passwordPart in $passwordParts) {
        try {
            $numericPasswordPart = [int]$passwordPart.Substring(0, 5)
            $checksum = [int]"$($passwordPart[5])"
            $remainder = $numericPasswordPart % 11
            if (-not ($remainder -eq $checksum)) {
                return $false
            }
        } catch {
            return $false
        }
    }
    
    return $true
}

function Lock-Volume {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID
    )
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstance -PersistentVolumeID "$PersistentVolumeID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        $result = $encVolumeInstance | Invoke-CimMethod -MethodName "Lock" -ErrorAction Stop
        if ($null -eq $result) {
            throw
        }
        return $result.ReturnValue
    } catch {
        return $E_FAIL
    }
}

function Get-VolumeConversionStatus {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID,
        [Parameter(Position = 1)] [int] $PrecisionFactor = 4
    )
    
    if ($PrecisionFactor -lt 1) {
        $PrecisionFactor = 1
    } elseif ($PrecisionFactor -gt 4) {
        $PrecisionFactor = 4
    }
    
    $conversionStatus = $null
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstance -PersistentVolumeID "$PersistentVolumeID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        $result = $encVolumeInstance | Invoke-CimMethod -MethodName "GetConversionStatus" -Arguments @{PrecisionFactor = $PrecisionFactor}
        if ($null -eq $result) {
            throw
        }
        
        # Pass on the results
        $volumeConversionStatus = $result.ConversionStatus
        $volumeEncryptionPercentage = $result.EncryptionPercentage
        $volumeEncryptionFlags = $result.EncryptionFlags
        $volumeWipingPercentage = $result.WipingPercentage
        $volumeWipingStatus = $result.WipingStatus
        
        $conversionStatus = [ConversionStatus]::new($volumeConversionStatus, $volumeEncryptionPercentage, $volumeEncryptionFlags, $volumeWipingStatus, $volumeWipingPercentage)
    } catch {
        return $conversionStatus
    }
    
    return $conversionStatus
}

function Get-VolumeProtectionStatus {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID
    )
    
    $protectionStatus = 2
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstance -PersistentVolumeID "$PersistentVolumeID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        
        $result = $encVolumeInstance | Invoke-CimMethod -MethodName "GetProtectionStatus"
        if (($null -eq $result) -or ($result.ReturnValue -ne 0)) {
            throw
        }
        
        $protectionStatus = $result.ProtectionStatus        
    } catch {
        return $protectionStatus
    }
    
    return $protectionStatus
}

function Unlock-EncryptedVolumeWithNumericalPassword {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID,
        [Parameter(Mandatory, Position = 1)] [string] $NumericalPassword
    )
    
    if (-not (Test-NumericalPasswordFormat -NumericalPassword "$NumericalPassword")) {
        return $FVE_E_INVALID_PASSWORD_FORMAT
    }
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstance -PersistentVolumeID "$PersistentVolumeID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        $result = $encVolumeInstance | Invoke-CimMethod -MethodName "UnlockWithNumericalPassword" -Arguments @{NumericalPassword = "$NumericalPassword"} -ErrorAction Stop
        if ($null -eq $result) {
            throw
        }
        return $result.ReturnValue
    } catch {
        return $E_FAIL
    }
}

function Get-VolumeEncryptionPercentage {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID
    )

    try {
        $conversionStatus = Get-VolumeConversionStatus -PersistentVolumeID $PersistentVolumeID        
        return $conversionStatus.EncryptionPercentage
    } catch {
        return 0
    }

}

function Start-VolumeEncryption {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $DeviceID
    )
    
    $encryptionResult = @{StatusCode = $null; KeyProtectorId = ""; NumericalPassword = ""}
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstanceByDeviceId -DeviceID "$DeviceID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        
        # Even though the documentation states we must call PrepareVolume before calling any of the
        # ProtectKeyWith* functions, calling them without calling PrepareVolume will call it anyway
        # with the default parameters, which we're more than happy with doing. Still, we have to do
        # it like this:
        # 1. Add the key protector and get the numerical password
        # 2. Actually encrypt the volume, since it is still decrypted and unprotected, meaning the
        #    key is in the clear.
        # Encrypting the volume will give a status code immediately after it starts, meaning the
        # implementation that called this must track encryption progress by querying conversion status.
        
        $keyProtectorResults = $encVolumeInstance | Invoke-CimMethod -MethodName "ProtectKeyWithNumericalPassword"
        if (($null -eq $keyProtectorResults) -or ($keyProtectorResults.ReturnValue -ne 0)) {
            throw
        }
        $encryptionResult["KeyProtectorId"] = $keyProtectorResults.VolumeKeyProtectorID
        
        $numericalPasswordResults = $encVolumeInstance | Invoke-CimMethod -MethodName "GetKeyProtectorNumericalPassword" -Arguments @{VolumeKeyProtectorID = "$($encryptionResult["KeyProtectorId"])"}
        if (($null -eq $numericalPasswordResults) -or ($numericalPasswordResults.ReturnValue -ne 0)) {
            throw
        }
        $encryptionResult["NumericalPassword"] = $numericalPasswordResults.NumericalPassword
        
        $encryptionResults = $encVolumeInstance | Invoke-CimMethod -MethodName "Encrypt"
        if ($null -eq $encryptionResults) {
            throw
        }
        
        $encryptionResult["StatusCode"] = $encryptionResults.ReturnValue
        
        return $encryptionResult
    } catch {
        return $E_FAIL
    }
}

function Start-VolumeDecryption {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $PersistentVolumeID
    )
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstance -PersistentVolumeID "$PersistentVolumeID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        
        $decryptionResults = $encVolumeInstance | Invoke-CimMethod -MethodName "Decrypt"
        if ($null -eq $decryptionResults) {
            throw
        }
        
        return $decryptionResults.ReturnValue
    } catch {
        return $E_FAIL
    }
}

function Pause-VolumeEncryptionOrDecryption {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $DeviceID
    )
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstanceByDeviceId -DeviceID "$DeviceID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        
        $pauseResults = $encVolumeInstance | Invoke-CimMethod -MethodName "PauseConversion"
        if ($null -eq $pauseResults) {
            throw
        }
        
        return $pauseResults.ReturnValue
    } catch {
        return $E_FAIL
    }
}

function Resume-VolumeEncryptionOrDecryption {
    param (
        [Parameter(Mandatory, Position = 0)] [string] $DeviceID
    )
    
    try {
        $encVolumeInstance = Get-EncryptedVolumeInstanceByDeviceId -DeviceID "$DeviceID"
        if ($null -eq $encVolumeInstance) {
            throw
        }
        
        $pauseResults = $encVolumeInstance | Invoke-CimMethod -MethodName "ResumeConversion"
        if ($null -eq $pauseResults) {
            throw
        }
        
        return $pauseResults.ReturnValue
    } catch {
        return $E_FAIL
    }
}