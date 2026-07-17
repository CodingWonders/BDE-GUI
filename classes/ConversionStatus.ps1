class ConversionStatus {
	[VolumeConversionStatus] $ConversionStatus
	[UInt32] $EncryptionPercentage
	[UInt32] $EncryptionFlags
	[VolumeWipingStatus] $WipingStatus
	[UInt32] $WipingPercentage
	
	ConversionStatus() {
		$this.ConversionStatus = [VolumeConversionStatus]::Unknown
		$this.EncryptionPercentage = 0
		$this.EncryptionFlags = 0
		$this.WipingStatus = [VolumeWipingStatus]::Unknown
		$this.WipingPercentage = 0
	}
	
	ConversionStatus($conversionStatus, $encryptionPercentage, $encryptionFlags) {
		$this.ConversionStatus = $conversionStatus
		$this.EncryptionPercentage = $encryptionPercentage
		$this.EncryptionFlags = $encryptionFlags
	}
	
	ConversionStatus($conversionStatus, $encryptionPercentage, $encryptionFlags, $wipingStatus, $wipingPercentage) {
		$this.ConversionStatus = $conversionStatus
		$this.EncryptionPercentage = $encryptionPercentage
		$this.EncryptionFlags = $encryptionFlags
		$this.WipingStatus = $wipingStatus
		$this.WipingPercentage = $wipingPercentage
	}
}

enum VolumeConversionStatus {
    Unknown = -1
    FullyDecrypted = 0
    FullyEncrypted = 1
    EncryptionInProgress = 2
    DecryptionInProgress = 3
    EncryptionPaused = 4
    DecryptionPaused = 5
}

enum VolumeWipingStatus {
	Unknown = -1
	FreeSpaceNotWiped = 0
	FreeSpaceWiped = 1
	FreeSpaceWipingInProgress = 2
	FreeSpaceWipingPaused = 3
}