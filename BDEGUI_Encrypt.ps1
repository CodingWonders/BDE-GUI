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
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUILockForm.Text, "OK", "Info")
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
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUILockForm.Text, "OK", "Info")
	} else {
		$VolumesComboBox.Items.AddRange(($global:encryptableVolumes | Select-Object -ExpandProperty DriveLetter))
		$VolumesComboBox.SelectedIndex = 0
	}
	
	$BDEGUIEncryptForm.DialogResult = 'None'
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
		
		# this has to do with the precision factor for the conversion status: the more precise it is, the more
		# zeros we have to add here.
		$divider = 10000
		
		$volumeConversionStatus = Get-VolumeConversionStatus -PersistentVolumeID $selectedEncryptableVolume.PersistentVolumeID
		$encPercent = $volumeConversionStatus.EncryptionPercentage / $divider
		
		$lblConversionStatus.Text = $volumeConversionStatus.ConversionStatus
		$lblPercentEncrypted.Text = "$($encPercent)%"
		$pbPercentEncrypted.Value = $encPercent
		
		$Encrypt_Button.Enabled = $volumeConversionStatus.ConversionStatus -ne [VolumeConversionStatus]::FullyEncrypted
	} catch {
		# don't do anything
	}
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'bdegui_encrypt.designer.ps1')
$BDEGUIEncryptForm.ShowDialog() | Out-Null