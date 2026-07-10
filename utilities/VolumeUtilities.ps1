using namespace System.Collections.Generic

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