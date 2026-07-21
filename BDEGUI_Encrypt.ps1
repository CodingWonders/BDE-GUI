using namespace System.Collections.Generic

foreach ($clsFile in Get-ChildItem -Path "$PSScriptRoot\classes" -Filter "*.ps1") {
    . "$($clsFile.FullName)"
}

foreach ($utilFile in Get-ChildItem -Path "$PSScriptRoot\utilities" -Filter "*.ps1") {
    . "$($utilFile.FullName)"
}

$BDEGUIUnlockForm_Load = {
	# get and display encryptable volumes
	$EncryptionControlsTLP.Enabled = $false
	$global:volumes = Get-EncryptableVolumes
	
	if ($global:volumes.Count -lt 1) {
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUIEncryptForm.Text, "OK", "Info")
	} else {
		$VolumesComboBox.Items.AddRange(($global:volumes | Select-Object -ExpandProperty DriveLetter))
		$VolumesComboBox.SelectedIndex = 0
	}
}

$Refresh_Button_Click = {
	# get and display encryptable volumes
	$global:volumes = Get-EncryptableVolumes
	
	$VolumesComboBox.Items.Clear()
	
	if ($global:volumes.Count -lt 1) {
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUIEncryptForm.Text, "OK", "Info")
	} else {
		$VolumesComboBox.Items.AddRange(($global:volumes | Select-Object -ExpandProperty DriveLetter))
		$VolumesComboBox.SelectedIndex = 0
	}
	
	$BDEGUIEncryptForm.DialogResult = 'None'
}

$VolumesComboBox_SelectedIndexChanged = {
	# display information about the selected volume
	try {
		$selectedEncryptableVolume = $global:volumes[$VolumesComboBox.SelectedIndex]
		if ($null -eq $selectedEncryptableVolume) {
			return
		}
		
		$lblDeviceID.Text = $selectedEncryptableVolume.DeviceID
		$lblPersistentVolumeID.Text = $selectedEncryptableVolume.PersistentVolumeID
	
		# this has to do with the precision factor for the conversion status: the more precise it is, the more
		# zeros we have to add here.
		$divider = 10000
		
		if ($selectedEncryptableVolume.PersistentVolumeID -ne "") {
			# If the drive is locked, we can't really do anything with it; that includes showing the info
			if ((Get-VolumeLockStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID) -eq [LockStatus]::Locked) {
				[System.Windows.Forms.MessageBox]::Show("This volume is locked. Provide the recovery key to unlock this volume.", $BDEGUIEncryptForm.Text, "OK", "Info")
				& (Join-Path $PSScriptRoot "bdegui_unlock.ps1")
				
				$lblConversionStatus.Text = "Locked"
				$lblPercentEncrypted.Text = "100%"
				$pbPercentEncrypted.Value = 100
				$lblProtectionStatus.Text = "Locked"
				
				$Encrypt_Button.Enabled = $false
				
				return
			}
			
			$volumeConversionStatus = Get-VolumeConversionStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
			$volumeProtectionStatus = Get-VolumeProtectionStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		} else {
			# The volume is not encrypted
			$volumeConversionStatus = [ConversionStatus]::new([VolumeConversionStatus]::FullyDecrypted)
			$volumeProtectionStatus = 0
		}
		
		$encPercent = $volumeConversionStatus.EncryptionPercentage / $divider
		
		$convStatusStr = ""
		switch ($volumeConversionStatus.ConversionStatus) {
			"Unknown" { $convStatusStr = "Unknown" }
			"FullyDecrypted" { $convStatusStr = "Fully Decrypted" }
			"FullyEncrypted" { $convStatusStr = "Fully Encrypted" }
			"EncryptionInProgress" { $convStatusStr = "Encryption in progress..." }
			"DecryptionInProgress" { $convStatusStr = "Decryption in progress..." }
			"EncryptionPaused" { $convStatusStr = "Encryption Paused" }
			"DecryptionPaused" { $convStatusStr = "Decryption Paused" }
		}
		
		$protectStatusStr = ""
		switch ($volumeProtectionStatus) {
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
		
		$lblConversionStatus.Text = $convStatusStr
		$lblPercentEncrypted.Text = "$($encPercent)%"
		$pbPercentEncrypted.Value = $encPercent
		$lblProtectionStatus.Text = $protectStatusStr
		
		$Encrypt_Button.Enabled = $volumeConversionStatus.ConversionStatus -ne [VolumeConversionStatus]::FullyEncrypted
	} catch {
		# don't do anything
		Write-Host $_
	}
}

$Encrypt_Button_Click = {
	$encryptionResult = Start-VolumeEncryption -DeviceID "$($global:volumes[$VolumesComboBox.SelectedIndex].DeviceID)"
	if (($null -eq $encryptionResult) -or ($encryptionResult["StatusCode"] -ne 0)) {
		if ($null -ne $encryptionResult) {
			$msg = ""
			switch ($encryptionResult["StatusCode"]) {
				$E_INVALIDARG { $msg = "The selected encryption method is not supported on this environment." }
				$FVE_E_CANNOT_ENCRYPT_NO_KEY { $msg = "No encryption key exists for the selected volume." }
				$ERROR_INVALID_OPERATION { $msg = "No encryption key exists for the selected volume." }
				$FVE_E_CANNOT_SET_FVEK_ENCRYPTED { $msg = "The provided encryption method does not match that of the partially or fully encrypted volume." }
				$FVE_E_CLUSTERING_NOT_SUPPORTED { $msg = "The current environment is configured to be part of a server cluster. This is not supported." }
				$FVE_E_LOCKED_VOLUME { $msg = "Currently, this volume is locked." }
				$FVE_E_POLICY_PASSWORD_REQUIRED { $msg = "No supported key protectors of numerical password type are specified." }
			}
			[System.Windows.Forms.MessageBox]::Show("$msg", $BDEGUIEncryptForm.Text, "OK", "Error")
		} else {
			[System.Windows.Forms.MessageBox]::Show("The selected volume could not be encrypted.", $BDEGUIEncryptForm.Text, "OK", "Error")
		}
		return
	}
	
	$EncryptionControlsTLP.Enabled = $true
	$tmrEncryptionProgress.Enabled = $true
	$Panel2.Visible = $true
	$lblNewProtectorId.Text = $encryptionResult["KeyProtectorId"]
	$lblNewPassword.Text = $encryptionResult["NumericalPassword"]
	$Encrypt_Button.Enabled = $false
	$VolumesComboBox.Enabled = $false
	$Refresh_Button.Enabled = $false
}

$ResumeEncryption_Button_Click = {
	if ((Resume-VolumeEncryptionOrDecryption -DeviceID "$($global:volumes[$VolumesComboBox.SelectedIndex].DeviceID)") -eq $S_OK) {
		$PauseEncryption_Button.Enabled = $true
		$ResumeEncryption_Button.Enabled = $false
	} else {
		[System.Windows.Forms.MessageBox]::Show("Encryption could not be resumed.", $BDEGUIEncryptForm.Text, "OK", "Error")
	}	
}

$PauseEncryption_Button_Click = {
	if ((Pause-VolumeEncryptionOrDecryption -DeviceID "$($global:volumes[$VolumesComboBox.SelectedIndex].DeviceID)") -eq $S_OK) {
		$PauseEncryption_Button.Enabled = $false
		$ResumeEncryption_Button.Enabled = $true
	} else {
		[System.Windows.Forms.MessageBox]::Show("Encryption could not be paused.", $BDEGUIEncryptForm.Text, "OK", "Error")
	}
}

$tmrEncryptionProgress_Tick = {
	# At this point we already have a persistent volume ID; we'll use it
	$newPersistentVolumeId = Get-PersistentVolumeIDFromDeviceId -DeviceID "$($global:volumes[$VolumesComboBox.SelectedIndex].DeviceID)"
	$lblPersistentVolumeID.Text = $newPersistentVolumeId
	
	$volumeConversionStatus = Get-VolumeConversionStatus -PersistentVolumeID $newPersistentVolumeId
	$volumeProtectionStatus = Get-VolumeProtectionStatus -PersistentVolumeID $newPersistentVolumeId
	
	# this has to do with the precision factor for the conversion status: the more precise it is, the more
	# zeros we have to add here.
	$divider = 10000
	
	$encPercent = $volumeConversionStatus.EncryptionPercentage / $divider
	
	$convStatusStr = ""
	switch ($volumeConversionStatus.ConversionStatus) {
		"Unknown" { $convStatusStr = "Unknown" }
		"FullyDecrypted" { $convStatusStr = "Fully Decrypted" }
		"FullyEncrypted" { $convStatusStr = "Fully Encrypted" }
		"EncryptionInProgress" { $convStatusStr = "Encryption in progress..." }
		"DecryptionInProgress" { $convStatusStr = "Decryption in progress..." }
		"EncryptionPaused" { $convStatusStr = "Encryption Paused" }
		"DecryptionPaused" { $convStatusStr = "Decryption Paused" }
	}
	
	$protectStatusStr = ""
	switch ($volumeProtectionStatus) {
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
	
	$lblConversionStatus.Text = $convStatusStr
	$lblPercentEncrypted.Text = "$($encPercent)%"
	$pbPercentEncrypted.Value = $encPercent
	$lblProtectionStatus.Text = $protectStatusStr
	
	# handle timer-specific stuff
	if ($volumeConversionStatus.ConversionStatus -eq [volumeConversionStatus]::FullyEncrypted) {
		$tmrEncryptionProgress.Enabled = $false
		$EncryptionControlsTLP.Enabled = $false
		$VolumesComboBox.Enabled = $true
		$Refresh_Button.Enabled = $true
	}
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'bdegui_encrypt.designer.ps1') | Out-Null
$BDEGUIEncryptForm.ShowDialog() | Out-Null