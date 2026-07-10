$BDEGUILockForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.Label]$Label2 = $null
[System.Windows.Forms.ComboBox]$VolumesComboBox = $null
[System.Windows.Forms.Button]$OK_Button = $null
[System.Windows.Forms.Button]$Cancel_Button = $null
[System.Windows.Forms.Label]$VolStatusLabel = $null
[System.Windows.Forms.Button]$Refresh_Button = $null
function InitializeComponent
{
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$Label2 = (New-Object -TypeName System.Windows.Forms.Label)
$VolumesComboBox = (New-Object -TypeName System.Windows.Forms.ComboBox)
$OK_Button = (New-Object -TypeName System.Windows.Forms.Button)
$Cancel_Button = (New-Object -TypeName System.Windows.Forms.Button)
$VolStatusLabel = (New-Object -TypeName System.Windows.Forms.Label)
$Refresh_Button = (New-Object -TypeName System.Windows.Forms.Button)
$BDEGUILockForm.SuspendLayout()
#
#Label1
#
$Label1.AutoSize = $true
$Label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]241,[System.Int32]20))
$Label1.TabIndex = [System.Int32]0
$Label1.Text = [System.String]'Lock a decrypted BitLocker drive.'
#
#Label2
#
$Label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]80,[System.Int32]39))
$Label2.Name = [System.String]'Label2'
$Label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]165,[System.Int32]20))
$Label2.TabIndex = [System.Int32]1
$Label2.Text = [System.String]'Volume to lock:'
$Label2.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#VolumesComboBox
#
$VolumesComboBox.FormattingEnabled = $true
$VolumesComboBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]251,[System.Int32]36))
$VolumesComboBox.Name = [System.String]'VolumesComboBox'
$VolumesComboBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]383,[System.Int32]28))
$VolumesComboBox.TabIndex = [System.Int32]2
$VolumesComboBox.add_SelectedIndexChanged($VolumesComboBox_SelectedIndexChanged)
#
#OK_Button
#
$OK_Button.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom
$OK_Button.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OK_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]315,[System.Int32]100))
$OK_Button.Name = [System.String]'OK_Button'
$OK_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]29))
$OK_Button.TabIndex = [System.Int32]4
$OK_Button.Text = [System.String]'OK'
$OK_Button.UseVisualStyleBackColor = $true
$OK_Button.add_Click($OK_Button_Click)
#
#Cancel_Button
#
$Cancel_Button.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom
$Cancel_Button.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Cancel_Button.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$Cancel_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]396,[System.Int32]100))
$Cancel_Button.Name = [System.String]'Cancel_Button'
$Cancel_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]29))
$Cancel_Button.TabIndex = [System.Int32]5
$Cancel_Button.Text = [System.String]'Cancel'
$Cancel_Button.UseVisualStyleBackColor = $true
#
#VolStatusLabel
#
$VolStatusLabel.AutoSize = $true
$VolStatusLabel.BackColor = [System.Drawing.SystemColors]::Control
$VolStatusLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$VolStatusLabel.ForeColor = [System.Drawing.Color]::Black
$VolStatusLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]251,[System.Int32]71))
$VolStatusLabel.Name = [System.String]'VolStatusLabel'
$VolStatusLabel.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$VolStatusLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$VolStatusLabel.TabIndex = [System.Int32]1
$VolStatusLabel.Text = [System.String]'    '
#
#Refresh_Button
#
$Refresh_Button.BackColor = [System.Drawing.SystemColors]::Control
$Refresh_Button.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Refresh_Button.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$Refresh_Button.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Refresh_Button.ForeColor = [System.Drawing.Color]::Black
$Refresh_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]640,[System.Int32]35))
$Refresh_Button.Name = [System.String]'Refresh_Button'
$Refresh_Button.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Refresh_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]29))
$Refresh_Button.TabIndex = [System.Int32]5
$Refresh_Button.Text = [System.String]'Refresh'
$Refresh_Button.UseVisualStyleBackColor = $true
$Refresh_Button.add_Click($Refresh_Button_Click)
#
#BDEGUILockForm
#
$BDEGUILockForm.AcceptButton = $OK_Button
$BDEGUILockForm.CancelButton = $Cancel_Button
$BDEGUILockForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]141))
$BDEGUILockForm.Controls.Add($Cancel_Button)
$BDEGUILockForm.Controls.Add($OK_Button)
$BDEGUILockForm.Controls.Add($VolumesComboBox)
$BDEGUILockForm.Controls.Add($Label2)
$BDEGUILockForm.Controls.Add($Label1)
$BDEGUILockForm.Controls.Add($VolStatusLabel)
$BDEGUILockForm.Controls.Add($Refresh_Button)
$BDEGUILockForm.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BDEGUILockForm.ForeColor = [System.Drawing.Color]::Black
$BDEGUILockForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$BDEGUILockForm.MaximizeBox = $false
$BDEGUILockForm.MinimizeBox = $false
$BDEGUILockForm.ShowIcon = $false
$BDEGUILockForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$BDEGUILockForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$BDEGUILockForm.Text = [System.String]'Lock Encrypted Drive'
$BDEGUILockForm.add_Load($BDEGUILockForm_Load)
$BDEGUILockForm.ResumeLayout($false)
$BDEGUILockForm.PerformLayout()
Add-Member -InputObject $BDEGUILockForm -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUILockForm -Name Label2 -Value $Label2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUILockForm -Name VolumesComboBox -Value $VolumesComboBox -MemberType NoteProperty
Add-Member -InputObject $BDEGUILockForm -Name OK_Button -Value $OK_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUILockForm -Name Cancel_Button -Value $Cancel_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUILockForm -Name VolStatusLabel -Value $VolStatusLabel -MemberType NoteProperty
Add-Member -InputObject $BDEGUILockForm -Name Refresh_Button -Value $Refresh_Button -MemberType NoteProperty
}
. InitializeComponent
