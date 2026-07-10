using namespace System.Collections.Generic

foreach ($clsFile in Get-ChildItem -Path "$PSScriptRoot\classes" -Filter "*.ps1") {
    . "$($clsFile.FullName)"
}

foreach ($utilFile in Get-ChildItem -Path "$PSScriptRoot\utilities" -Filter "*.ps1") {
    . "$($utilFile.FullName)"
}

$BDEGUILockForm_Load = {
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
	
	if ($global:encryptableVolumes.Count -lt 1) {
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUILockForm.Text, "OK", "Info")
	} else {
		$VolumesComboBox.Items.AddRange(($global:encryptableVolumes | Select-Object -ExpandProperty DriveLetter))
		$VolumesComboBox.SelectedIndex = 0
	}
	
	$BDEGUILockForm.DialogResult = 'None'
}

$OK_Button_Click = {
	# Build up the numerical password.
	$BDEGUILockForm.Cursor = 'WaitCursor'
	$lockResult = Lock-Volume -PersistentVolumeID "$($global:encryptableVolumes[$VolumesComboBox.SelectedIndex].PersistentVolumeID)"
	$BDEGUILockForm.Cursor = 'Arrow'
	
	switch ($lockResult) {
		$S_OK {
			[System.Windows.Forms.MessageBox]::Show("The selected volume has been successfully locked.", $BDEGUILockForm.Text, "OK", "Info")
			$BDEGUILockForm.DialogResult = 'OK'
			$BDEGUILockForm.Close()
		}
		$E_ACCESS_DENIED {
			[System.Windows.Forms.MessageBox]::Show("The selected volume could not be locked because some applications have opened files in it.", $BDEGUILockForm.Text, "OK", "Error")
			return
		}
		$FVE_E_LOCKED_VOLUME {
			[System.Windows.Forms.MessageBox]::Show("The selected volume is already locked.", $BDEGUILockForm.Text, "OK", "Error")
			return
		}
		$FVE_E_NOT_ENCRYPTED {
			[System.Windows.Forms.MessageBox]::Show("The selected volume is not encrypted.", $BDEGUILockForm.Text, "OK", "Error")
			return
		}
		$FVE_E_PROTECTION_DISABLED {
			[System.Windows.Forms.MessageBox]::Show("The selected volume has had its key protectors disabled and its keys available in the clear.", $BDEGUILockForm.Text, "OK", "Error")
			return
		}
		$FVE_E_RECOVERY_KEY_REQUIRED {
			[System.Windows.Forms.MessageBox]::Show("The selected volume does not use numerical passwords or external keys required to unlock volumes, so the volume cannot be locked.", $BDEGUILockForm.Text, "OK", "Error")
			return
		}
		default {
			[System.Windows.Forms.MessageBox]::Show("The volume could not be unlocked. Error code: $lockResult", $BDEGUILockForm.Text, "OK", "Error")
			return
		}
	}
}

$VolumesComboBox_SelectedIndexChanged = {
	# Query lock status
	$lockStatus = Get-VolumeLockStatus -PersistentVolumeID "$($global:encryptableVolumes[$VolumesComboBox.SelectedIndex].PersistentVolumeID)"
	switch ($lockStatus) {
		0 {
			$VolStatusLabel.Text = "This volume is unlocked."
		}
		1 {
			$VolStatusLabel.Text = "This volume is locked."
		}
	}
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'bdegui_lock.designer.ps1')
$BDEGUILockForm.ShowDialog() | Out-Null