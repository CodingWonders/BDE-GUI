class EncryptableVolume {
    [string]$DeviceID
    [string]$DriveLetter
    [string]$PersistentVolumeID

    EncryptableVolume($devId, $drLetter, $pVolId) {
        $this.DeviceID = $devId
        $this.DriveLetter = $drLetter
        $this.PersistentVolumeID = $pVolId
    }
}