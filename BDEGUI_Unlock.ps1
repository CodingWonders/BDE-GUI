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
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'bdegui_unlock.designer.ps1')
$BDEGUIUnlockForm.ShowDialog()