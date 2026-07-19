class ConversionStatus {
	[VolumeConversionStatus] $ConversionStatus
	[UInt32] $EncryptionPercentage
	[UInt32] $EncryptionFlags
	[VolumeWipingStatus] $WipingStatus
	[UInt32] $WipingPercentage
	
	ConversionStatus() {
		$this.Init()
	}
	
	ConversionStatus($conversionStatus) {
		$this.Init($conversionStatus)
	}
	
	ConversionStatus($conversionStatus, $encryptionPercentage, $encryptionFlags) {
		$this.Init($conversionStatus, $encryptionPercentage, $encryptionFlags)
	}
	
	ConversionStatus($conversionStatus, $encryptionPercentage, $encryptionFlags, $wipingStatus, $wipingPercentage) {
		$this.Init($conversionStatus, $encryptionPercentage, $encryptionFlags, $wipingStatus, $wipingPercentage)
	}
	
	# Allow for constructor chaining as pwsh doesn't support it by default and I don't want to repeat
	# myself. https://stackoverflow.com/questions/44413206/constructor-chaining-in-powershell-call-other-constructors-in-the-same-class/44414513#44414513
	hidden Init() {
		$this.Init([VolumeConversionStatus]::Unknown, 0, 0, [VolumeWipingStatus]::Unknown, 0)
	}
	
	hidden Init($conversionStatus) {
		$this.Init($conversionStatus, 0, 0, [VolumeWipingStatus]::Unknown, 0)
	}
	
	hidden Init($conversionStatus, $encryptionPercentage, $encryptionFlags) {
		$this.Init($conversionStatus, $encryptionPercentage, $encryptionFlags, [VolumeWipingStatus]::Unknown, 0)
	}
	
	hidden Init($conversionStatus, $encryptionPercentage, $encryptionFlags, $wipingStatus, $wipingPercentage) {
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