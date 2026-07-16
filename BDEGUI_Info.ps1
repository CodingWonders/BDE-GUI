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
	
	$BDEGUIInfoForm.DialogResult = 'None'
}

$VolumesComboBox_SelectedIndexChanged = {
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'bdegui_info.designer.ps1')
$BDEGUIInfoForm.ShowDialog() | Out-Null