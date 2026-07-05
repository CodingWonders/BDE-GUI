using namespace System.Collections.Generic

function Get-EncryptedVolumes {
    $encryptedVolumes = [List[EncryptableVolume]]::new()

    $encDrives = Get-CimInstance -Namespace "root\CIMv2\Security\MicrosoftVolumeEncryption" -Query "SELECT * FROM Win32_EncryptableVolume"
    foreach ($encDrive in $encDrives) {
        $encryptedVolumes.Add([EncryptableVolume]::new("$($encDrive.DeviceID)", "$($encDrive.DriveLetter)", "$($encDrive.PersistentVolumeID)"))
    }

    return $encryptedVolumes
}