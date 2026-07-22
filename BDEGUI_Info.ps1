using namespace System.Collections.Generic

foreach ($clsFile in Get-ChildItem -Path "$PSScriptRoot\classes" -Filter "*.ps1") {
    . "$($clsFile.FullName)"
}

foreach ($utilFile in Get-ChildItem -Path "$PSScriptRoot\utilities" -Filter "*.ps1") {
    . "$($utilFile.FullName)"
}

$BDEGUIUnlockForm_Load = {
	# get and display encryptable volumes
	$global:encryptableVolumes = Get-EncryptedVolumes
	
	if ($global:encryptableVolumes.Count -lt 1) {
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUIInfoForm.Text, "OK", "Info")
	} else {
		$VolumesComboBox.Items.AddRange(($global:encryptableVolumes | Select-Object -ExpandProperty DriveLetter))
		$VolumesComboBox.SelectedIndex = 0
	}
}

$Refresh_Button_Click = {
	# get and display encryptable volumes
	$global:encryptableVolumes = Get-EncryptedVolumes
	
	$VolumesComboBox.Items.Clear()
	
	if ($global:encryptableVolumes.Count -lt 1) {
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUIInfoForm.Text, "OK", "Info")
	} else {
		$VolumesComboBox.Items.AddRange(($global:encryptableVolumes | Select-Object -ExpandProperty DriveLetter))
		$VolumesComboBox.SelectedIndex = 0
	}
	
	$BDEGUIInfoForm.DialogResult = 'None'
}

$VolumesComboBox_SelectedIndexChanged = {
	# display information about the selected volume
	try {
		$selectedEncryptableVolume = $global:encryptableVolumes[$VolumesComboBox.SelectedIndex]
		if ($null -eq $selectedEncryptableVolume) {
			return
		}
		
		$lblDeviceID.Text = $selectedEncryptableVolume.DeviceID
		$lblPersistentVolumeID.Text = $selectedEncryptableVolume.PersistentVolumeID
		$conversionStatus = Get-VolumeConversionStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		$protectionStatus = Get-VolumeProtectionStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		$VersionStatus = Get-VolumeVersion -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		$lockStatus = Get-VolumeLockStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID

		$Panel1.Enabled = $lockStatus -eq [LockStatus]::Unlocked

		switch ($lockStatus) {
			0 { $lblVolumeLockStatus.text = "Unlocked" }
			1 { $lblVolumeLockStatus.text = "Locked" }
			-1 { $lblVolumeLockStatus.text = "Unknown" }
		}

		if ($lockStatus -eq [LockStatus]::Unlocked) {
			$convStatusStr = ""
			switch ($conversionStatus.ConversionStatus) {
				"Unknown" { $convStatusStr = "Unknown" }
				"FullyDecrypted" { $convStatusStr = "Fully Decrypted" }
				"FullyEncrypted" { $convStatusStr = "Fully Encrypted" }
				"EncryptionInProgress" { $convStatusStr = "Encryption in progress..." }
				"DecryptionInProgress" { $convStatusStr = "Decryption in progress..." }
				"EncryptionPaused" { $convStatusStr = "Encryption Paused" }
				"DecryptionPaused" { $convStatusStr = "Decryption Paused" }
			}
			$lblConversionStatus.text = $convStatusStr

			$encryptionPercentage = $conversionStatus.EncryptionPercentage / 10000

			$lblPercentEncrypted.Text = "$encryptionPercentage %"
			$pbPercentEncrypted.Value = $encryptionPercentage

			$protectStatusStr = ""
			switch ($protectionStatus) {
				0 {
					if ($selectedEncryptableVolume.PersistentVolumeID -ne "") {
						$protectStatusStr = "Unprotected. Recovery keys in the clear"
					} else {
						$protectStatusStr = "Unprotected"
					}
				}
				1 { $protectStatusStr = "Protected" }
				2 { $protectStatusStr = "Unknown" }
			}
			$lblProtectionStatus.Text = $protectStatusStr

			$VersionStr = ""
			switch ($VersionStatus) {
				0 { $VersionStr = "Unknown" }
				1 { $VersionStr = "Windows Vista" }
				2 { $VersionStr = "Windows 7/8/10/11" }
			}

			$lblVersion.Text = "$VersionStatus ($VersionStr)"
			$lvProtectors.Items.Clear()

			$KeyProtectors = Get-VolumeKeyProtectors -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
			foreach ($keyProtector in $KeyProtectors) {
				$protectorTypeStr = ""
				switch ($keyProtector.ProtectorType){
					"Unknown" { $protectorTypeStr = "Unknown"}
					"TPM" { $protectorTypeStr = "TPM"}
					"ExternalKey" { $protectorTypeStr = "External Key"}
					"NumericalPassword" { $protectorTypeStr = "Numerical Password"}
					"TPMPin" { $protectorTypeStr = "TPM & PIN"}
					"TPMStartupKey" { $protectorTypeStr = "TPM & Startup Key"}
					"TPMPinStartupKey" { $protectorTypeStr = "TPM, PIN & Startup Key"}
					"PublicKey" { $protectorTypeStr = "Public Key"}
					"Passphrase" { $protectorTypeStr = "Passphrase"}
					"TPMCert" { $protectorTypeStr = "TPM Certificate"}
					"CNG" { $protectorTypeStr = "CryptoAPI Next Generation (CNG) Protector"}
				}
				$lvProtectors.Items.Add([System.Windows.Forms.ListViewItem]::new([string[]]@($keyProtector.ProtectorId , $protectorTypeStr)))
			}
		}		
	} catch {
		# don't do anything
	}
}

$cbRefreshConvStatus_CheckedChanged = {
	$tmrSynchro.Enabled = $cbRefreshConvStatus.Checked
}

$tmrSynchro_Tick = {
	try {
		$selectedEncryptableVolume = $global:encryptableVolumes[$VolumesComboBox.SelectedIndex]
		$conversionStatus = Get-VolumeConversionStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		$protectionStatus = Get-VolumeProtectionStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		$VersionStatus = Get-VolumeVersion -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		$lockStatus = Get-VolumeLockStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID

		$Panel1.Enabled = $lockStatus -eq [LockStatus]::Unlocked

		switch ($lockStatus) {
			0 { $lblVolumeLockStatus.text = "Unlocked" }
			1 { $lblVolumeLockStatus.text = "Locked" }
			-1 { $lblVolumeLockStatus.text = "Unknown" }
		}

		if ($lockStatus -eq [LockStatus]::Unlocked) {
			$convStatusStr = ""
			switch ($conversionStatus.ConversionStatus) {
				"Unknown" { $convStatusStr = "Unknown" }
				"FullyDecrypted" { $convStatusStr = "Fully Decrypted" }
				"FullyEncrypted" { $convStatusStr = "Fully Encrypted" }
				"EncryptionInProgress" { $convStatusStr = "Encryption in progress..." }
				"DecryptionInProgress" { $convStatusStr = "Decryption in progress..." }
				"EncryptionPaused" { $convStatusStr = "Encryption Paused" }
				"DecryptionPaused" { $convStatusStr = "Decryption Paused" }
			}
			$lblConversionStatus.text = $convStatusStr

			$encryptionPercentage = $conversionStatus.EncryptionPercentage / 10000

			$lblPercentEncrypted.Text = "$encryptionPercentage %"
			$pbPercentEncrypted.Value = $encryptionPercentage

			$protectStatusStr = ""
			switch ($protectionStatus) {
				0 {
					if ($selectedEncryptableVolume.PersistentVolumeID -ne "") {
						$protectStatusStr = "Unprotected. Recovery keys in the clear"
					} else {
						$protectStatusStr = "Unprotected"
					}
				}
				1 { $protectStatusStr = "Protected" }
				2 { $protectStatusStr = "Unknown" }
			}
			$lblProtectionStatus.Text = $protectStatusStr

			$VersionStr = ""
			switch ($VersionStatus) {
				0 { $VersionStr = "Unknown" }
				1 { $VersionStr = "Windows Vista" }
				2 { $VersionStr = "Windows 7/8/10/11" }
			}

			$lblVersion.Text = "$VersionStatus ($VersionStr)"
			$lvProtectors.Items.Clear()

			$KeyProtectors = Get-VolumeKeyProtectors -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
			foreach ($keyProtector in $KeyProtectors) {
				$protectorTypeStr = ""
				switch ($keyProtector.ProtectorType){
					"Unknown" { $protectorTypeStr = "Unknown"}
					"TPM" { $protectorTypeStr = "TPM"}
					"ExternalKey" { $protectorTypeStr = "External Key"}
					"NumericalPassword" { $protectorTypeStr = "Numerical Password"}
					"TPMPin" { $protectorTypeStr = "TPM & PIN"}
					"TPMStartupKey" { $protectorTypeStr = "TPM & Startup Key"}
					"TPMPinStartupKey" { $protectorTypeStr = "TPM, PIN & Startup Key"}
					"PublicKey" { $protectorTypeStr = "Public Key"}
					"Passphrase" { $protectorTypeStr = "Passphrase"}
					"TPMCert" { $protectorTypeStr = "TPM Certificate"}
					"CNG" { $protectorTypeStr = "CryptoAPI Next Generation (CNG) Protector"}
				}
				$lvProtectors.Items.Add([System.Windows.Forms.ListViewItem]::new([string[]]@($keyProtector.ProtectorId , $protectorTypeStr)))
			}
		}	
	} catch {
		
	}
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'bdegui_info.designer.ps1')
$BDEGUIInfoForm.ShowDialog() | Out-Null