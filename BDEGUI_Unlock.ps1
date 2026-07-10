using namespace System.Collections.Generic

foreach ($clsFile in Get-ChildItem -Path "$PSScriptRoot\classes" -Filter "*.ps1") {
    . "$($clsFile.FullName)"
}

foreach ($utilFile in Get-ChildItem -Path "$PSScriptRoot\utilities" -Filter "*.ps1") {
    . "$($utilFile.FullName)"
}

$RPS8_TextChanged = {
    $OK_Button.Enabled = $RPS1.Text -ne "" -and $RPS2.Text -ne "" -and $RPS3.Text -ne "" -and $RPS4.Text -ne "" -and $RPS5.Text -ne "" -and $RPS6.Text -ne "" -and $RPS7.Text -ne "" -and $RPS8.Text -ne ""
}
$RPS7_TextChanged = {
    if ($RPS7.Text.Length -ge 6) {
		# Switch to the next segment
		$RPS8.SelectAll()
		$RPS8.Focus()
	}
}
$RPS6_TextChanged = {
    if ($RPS6.Text.Length -ge 6) {
		# Switch to the next segment
		$RPS7.SelectAll()
		$RPS7.Focus()
	}
}
$RPS5_TextChanged = {
    if ($RPS5.Text.Length -ge 6) {
		# Switch to the next segment
		$RPS6.SelectAll()
		$RPS6.Focus()
	}
}
$RPS4_TextChanged = {
    if ($RPS4.Text.Length -ge 6) {
		# Switch to the next segment
		$RPS5.SelectAll()
		$RPS5.Focus()
	}
}
$RPS3_TextChanged = {
    if ($RPS3.Text.Length -ge 6) {
		# Switch to the next segment
		$RPS4.SelectAll()
		$RPS4.Focus()
	}
}
$RPS2_TextChanged = {
    if ($RPS2.Text.Length -ge 6) {
		# Switch to the next segment
		$RPS3.SelectAll()
		$RPS3.Focus()
	}
}
$RPS1_TextChanged = {
    if ($RPS1.Text.Length -ge 6) {
		# Switch to the next segment
		$RPS2.SelectAll()
		$RPS2.Focus()
	}
}

$global:encryptableVolumes = [List[EncryptableVolume]]::new()

$BDEGUIUnlockForm_Load = {
	# get and display encryptable volumes
	$global:encryptableVolumes = Get-EncryptedVolumes
	
	if ($global:encryptableVolumes.Count -lt 1) {
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUIUnlockForm.Text, "OK", "Info")
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
		[System.Windows.Forms.MessageBox]::Show("No encryptable volumes have been detected. Connect an encryptable volume and click Refresh.", $BDEGUIUnlockForm.Text, "OK", "Info")
	} else {
		$VolumesComboBox.Items.AddRange(($global:encryptableVolumes | Select-Object -ExpandProperty DriveLetter))
		$VolumesComboBox.SelectedIndex = 0
	}
	
	$BDEGUIUnlockForm.DialogResult = 'None'
}

$VolumesComboBox_SelectedIndexChanged = {
	$volumeProtectors = Get-VolumeKeyProtectors -PersistentVolumeID "$($global:encryptableVolumes[$VolumesComboBox.SelectedIndex].PersistentVolumeID)"
	$passwordProtectors = $volumeProtectors | Where-Object { $_.ProtectorType -eq [KeyProtectorType]::NumericalPassword }
	if ($passwordProtectors -eq $null) {
		[System.Windows.Forms.MessageBox]::Show("This volume does not appear to use a numerical password as a key protector.", $BDEGUIUnlockForm.Text, "OK", "Info")
		$KPIDLabel.Text = ""
	} else {
		$KPIDLabel.Text = "$($passwordProtectors.ProtectorId.Replace('{', '').Replace('}', ''))"
	}
}

$OK_Button_Click = {
	# Build up the numerical password.
	$BDEGUIUnlockForm.Cursor = 'WaitCursor'
	$numericalPassword = "$($RPS1.Text)-$($RPS2.Text)-$($RPS3.Text)-$($RPS4.Text)-$($RPS5.Text)-$($RPS6.Text)-$($RPS7.Text)-$($RPS8.Text)"
	$unlockResult = Unlock-EncryptedVolumeWithNumericalPassword -PersistentVolumeID "$($global:encryptableVolumes[$VolumesComboBox.SelectedIndex].PersistentVolumeID)" -NumericalPassword "$numericalPassword"
	$BDEGUIUnlockForm.Cursor = 'Arrow'
	
	switch ($unlockResult) {
		$S_OK {
			[System.Windows.Forms.MessageBox]::Show("The selected volume has been successfully unlocked.", $BDEGUIUnlockForm.Text, "OK", "Info")
			$BDEGUIUnlockForm.DialogResult = 'OK'
			$BDEGUIUnlockForm.Close()
		}
		$FVE_E_NOT_ACTIVATED {
			[System.Windows.Forms.MessageBox]::Show("The selected volume does not have BitLocker turned on.", $BDEGUIUnlockForm.Text, "OK", "Error")
			return
		}
		$FVE_E_PROTECTOR_NOT_FOUND {
			[System.Windows.Forms.MessageBox]::Show("The selected volume does not use this method for recovery.", $BDEGUIUnlockForm.Text, "OK", "Error")
			return
		}
		$FVE_E_FAILED_AUTHENTICATION {
			[System.Windows.Forms.MessageBox]::Show("The selected volume cannot be unlocked with the provided password.", $BDEGUIUnlockForm.Text, "OK", "Error")
			return
		}
		$FVE_E_INVALID_PASSWORD_FORMAT {
			[System.Windows.Forms.MessageBox]::Show("The provided recovery password has not been typed correctly.", $BDEGUIUnlockForm.Text, "OK", "Error")
			return
		}
		default {
			[System.Windows.Forms.MessageBox]::Show("The volume could not be unlocked. Error code: $unlockResult", $BDEGUIUnlockForm.Text, "OK", "Error")
			return
		}
	}
}


Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'bdegui_unlock.designer.ps1')
$BDEGUIUnlockForm.ShowDialog() | Out-Null