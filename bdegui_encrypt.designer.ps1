$BDEGUIEncryptForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$Label2 = $null
[System.Windows.Forms.ComboBox]$VolumesComboBox = $null
[System.Windows.Forms.Button]$Refresh_Button = $null
[System.Windows.Forms.Panel]$InfoHeaderPanel = $null
[System.Windows.Forms.TableLayoutPanel]$EncryptionControlsTLP = $null
[System.Windows.Forms.Button]$PauseEncryption_Button = $null
[System.Windows.Forms.Button]$ResumeEncryption_Button = $null
[System.Windows.Forms.Button]$Encrypt_Button = $null
[System.Windows.Forms.Panel]$InfoBodyPanel = $null
[System.Windows.Forms.Panel]$Panel2 = $null
[System.Windows.Forms.Label]$lblNewPassword = $null
[System.Windows.Forms.Label]$Label8 = $null
[System.Windows.Forms.Label]$lblNewProtectorId = $null
[System.Windows.Forms.Label]$Label4 = $null
[System.Windows.Forms.Panel]$Panel1 = $null
[System.Windows.Forms.Label]$lblProtectionStatus = $null
[System.Windows.Forms.Label]$Label7 = $null
[System.Windows.Forms.ProgressBar]$pbPercentEncrypted = $null
[System.Windows.Forms.Label]$lblPercentEncrypted = $null
[System.Windows.Forms.Label]$Label6 = $null
[System.Windows.Forms.Label]$lblConversionStatus = $null
[System.Windows.Forms.Label]$Label5 = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.Label]$lblDeviceId = $null
[System.Windows.Forms.Label]$lblPersistentVolumeId = $null
[System.Windows.Forms.Label]$Label3 = $null
[System.Windows.Forms.Timer]$tmrEncryptionProgress = $null
[System.ComponentModel.IContainer]$components = $null
function InitializeComponent
{
$components = (New-Object -TypeName System.ComponentModel.Container)
$resources = . (Join-Path $PSScriptRoot 'BDEGUI_Encrypt.resources.ps1')
$Label2 = (New-Object -TypeName System.Windows.Forms.Label)
$VolumesComboBox = (New-Object -TypeName System.Windows.Forms.ComboBox)
$Refresh_Button = (New-Object -TypeName System.Windows.Forms.Button)
$InfoHeaderPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$EncryptionControlsTLP = (New-Object -TypeName System.Windows.Forms.TableLayoutPanel)
$PauseEncryption_Button = (New-Object -TypeName System.Windows.Forms.Button)
$ResumeEncryption_Button = (New-Object -TypeName System.Windows.Forms.Button)
$Encrypt_Button = (New-Object -TypeName System.Windows.Forms.Button)
$InfoBodyPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$Panel1 = (New-Object -TypeName System.Windows.Forms.Panel)
$lblProtectionStatus = (New-Object -TypeName System.Windows.Forms.Label)
$Label7 = (New-Object -TypeName System.Windows.Forms.Label)
$pbPercentEncrypted = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$lblPercentEncrypted = (New-Object -TypeName System.Windows.Forms.Label)
$Label6 = (New-Object -TypeName System.Windows.Forms.Label)
$lblConversionStatus = (New-Object -TypeName System.Windows.Forms.Label)
$Label5 = (New-Object -TypeName System.Windows.Forms.Label)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$lblDeviceId = (New-Object -TypeName System.Windows.Forms.Label)
$lblPersistentVolumeId = (New-Object -TypeName System.Windows.Forms.Label)
$Label3 = (New-Object -TypeName System.Windows.Forms.Label)
$tmrEncryptionProgress = (New-Object -TypeName System.Windows.Forms.Timer -ArgumentList @($components))
$Panel2 = (New-Object -TypeName System.Windows.Forms.Panel)
$Label4 = (New-Object -TypeName System.Windows.Forms.Label)
$lblNewProtectorId = (New-Object -TypeName System.Windows.Forms.Label)
$Label8 = (New-Object -TypeName System.Windows.Forms.Label)
$lblNewPassword = (New-Object -TypeName System.Windows.Forms.Label)
$InfoHeaderPanel.SuspendLayout()
$EncryptionControlsTLP.SuspendLayout()
$InfoBodyPanel.SuspendLayout()
$Panel1.SuspendLayout()
$Panel2.SuspendLayout()
$BDEGUIEncryptForm.SuspendLayout()
#
#Label2
#
$Label2.Anchor = [System.Windows.Forms.AnchorStyles]::Top
$Label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]14,[System.Int32]15))
$Label2.Name = [System.String]'Label2'
$Label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]20))
$Label2.TabIndex = [System.Int32]1
$Label2.Text = [System.String]'Volume:'
$Label2.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#VolumesComboBox
#
$VolumesComboBox.Anchor = [System.Windows.Forms.AnchorStyles]::Top
$VolumesComboBox.FormattingEnabled = $true
$VolumesComboBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]123,[System.Int32]12))
$VolumesComboBox.Name = [System.String]'VolumesComboBox'
$VolumesComboBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]383,[System.Int32]28))
$VolumesComboBox.TabIndex = [System.Int32]2
$VolumesComboBox.add_SelectedIndexChanged($VolumesComboBox_SelectedIndexChanged)
#
#Refresh_Button
#
$Refresh_Button.Anchor = [System.Windows.Forms.AnchorStyles]::Top
$Refresh_Button.BackColor = [System.Drawing.SystemColors]::Control
$Refresh_Button.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Refresh_Button.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$Refresh_Button.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Refresh_Button.ForeColor = [System.Drawing.Color]::Black
$Refresh_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]512,[System.Int32]11))
$Refresh_Button.Name = [System.String]'Refresh_Button'
$Refresh_Button.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Refresh_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]29))
$Refresh_Button.TabIndex = [System.Int32]5
$Refresh_Button.Text = [System.String]'Refresh'
$Refresh_Button.UseVisualStyleBackColor = $true
$Refresh_Button.add_Click($Refresh_Button_Click)
#
#InfoHeaderPanel
#
$InfoHeaderPanel.Controls.Add($EncryptionControlsTLP)
$InfoHeaderPanel.Controls.Add($Encrypt_Button)
$InfoHeaderPanel.Controls.Add($VolumesComboBox)
$InfoHeaderPanel.Controls.Add($Refresh_Button)
$InfoHeaderPanel.Controls.Add($Label2)
$InfoHeaderPanel.Dock = [System.Windows.Forms.DockStyle]::Top
$InfoHeaderPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$InfoHeaderPanel.Name = [System.String]'InfoHeaderPanel'
$InfoHeaderPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]48))
$InfoHeaderPanel.TabIndex = [System.Int32]6
#
#EncryptionControlsTLP
#
$EncryptionControlsTLP.AllowDrop = $true
$EncryptionControlsTLP.ColumnCount = [System.Int32]2
$EncryptionControlsTLP.ColumnStyles.Add((New-Object -TypeName System.Windows.Forms.ColumnStyle -ArgumentList @([System.Windows.Forms.SizeType]::Percent,[System.Single]50)))
$EncryptionControlsTLP.ColumnStyles.Add((New-Object -TypeName System.Windows.Forms.ColumnStyle -ArgumentList @([System.Windows.Forms.SizeType]::Percent,[System.Single]50)))
$EncryptionControlsTLP.Controls.Add($PauseEncryption_Button,[System.Int32]1,[System.Int32]0)
$EncryptionControlsTLP.Controls.Add($ResumeEncryption_Button,[System.Int32]0,[System.Int32]0)
$EncryptionControlsTLP.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]681,[System.Int32]6))
$EncryptionControlsTLP.Name = [System.String]'TableLayoutPanel1'
$EncryptionControlsTLP.RowCount = [System.Int32]1
$EncryptionControlsTLP.RowStyles.Add((New-Object -TypeName System.Windows.Forms.RowStyle -ArgumentList @([System.Windows.Forms.SizeType]::Percent,[System.Single]50)))
$EncryptionControlsTLP.RowStyles.Add((New-Object -TypeName System.Windows.Forms.RowStyle -ArgumentList @([System.Windows.Forms.SizeType]::Percent,[System.Single]50)))
$EncryptionControlsTLP.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]91,[System.Int32]36))
$EncryptionControlsTLP.TabIndex = [System.Int32]7
#
#PauseEncryption_Button
#
$PauseEncryption_Button.Dock = [System.Windows.Forms.DockStyle]::Fill
$PauseEncryption_Button.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]15.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$PauseEncryption_Button.Image = ([System.Drawing.Image]$resources.'PauseEncryption_Button.Image')
$PauseEncryption_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]48,[System.Int32]3))
$PauseEncryption_Button.Name = [System.String]'PauseEncryption_Button'
$PauseEncryption_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]40,[System.Int32]30))
$PauseEncryption_Button.TabIndex = [System.Int32]7
$PauseEncryption_Button.UseVisualStyleBackColor = $true
$PauseEncryption_Button.add_Click($PauseEncryption_Button_Click)
#
#ResumeEncryption_Button
#
$ResumeEncryption_Button.Dock = [System.Windows.Forms.DockStyle]::Fill
$ResumeEncryption_Button.Enabled = $false
$ResumeEncryption_Button.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]15.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$ResumeEncryption_Button.Image = ([System.Drawing.Image]$resources.'ResumeEncryption_Button.Image')
$ResumeEncryption_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]3))
$ResumeEncryption_Button.Name = [System.String]'ResumeEncryption_Button'
$ResumeEncryption_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]39,[System.Int32]30))
$ResumeEncryption_Button.TabIndex = [System.Int32]0
$ResumeEncryption_Button.UseVisualStyleBackColor = $true
$ResumeEncryption_Button.add_Click($ResumeEncryption_Button_Click)
#
#Encrypt_Button
#
$Encrypt_Button.Anchor = [System.Windows.Forms.AnchorStyles]::Top
$Encrypt_Button.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$Encrypt_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]593,[System.Int32]11))
$Encrypt_Button.Name = [System.String]'Encrypt_Button'
$Encrypt_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]29))
$Encrypt_Button.TabIndex = [System.Int32]6
$Encrypt_Button.Text = [System.String]'Encrypt'
$Encrypt_Button.UseVisualStyleBackColor = $true
$Encrypt_Button.add_Click($Encrypt_Button_Click)
#
#InfoBodyPanel
#
$InfoBodyPanel.Controls.Add($Panel2)
$InfoBodyPanel.Controls.Add($Panel1)
$InfoBodyPanel.Controls.Add($Label1)
$InfoBodyPanel.Controls.Add($lblDeviceId)
$InfoBodyPanel.Controls.Add($lblPersistentVolumeId)
$InfoBodyPanel.Controls.Add($Label3)
$InfoBodyPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$InfoBodyPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]48))
$InfoBodyPanel.Name = [System.String]'InfoBodyPanel'
$InfoBodyPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]297))
$InfoBodyPanel.TabIndex = [System.Int32]7
#
#Panel1
#
$Panel1.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Panel1.Controls.Add($lblProtectionStatus)
$Panel1.Controls.Add($Label7)
$Panel1.Controls.Add($pbPercentEncrypted)
$Panel1.Controls.Add($lblPercentEncrypted)
$Panel1.Controls.Add($Label6)
$Panel1.Controls.Add($lblConversionStatus)
$Panel1.Controls.Add($Label5)
$Panel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]84,[System.Int32]76))
$Panel1.Name = [System.String]'Panel1'
$Panel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]617,[System.Int32]130))
$Panel1.TabIndex = [System.Int32]6
#
#lblProtectionStatus
#
$lblProtectionStatus.AutoSize = $true
$lblProtectionStatus.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]204,[System.Int32]92))
$lblProtectionStatus.Name = [System.String]'lblProtectionStatus'
$lblProtectionStatus.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblProtectionStatus.TabIndex = [System.Int32]6
$lblProtectionStatus.Text = [System.String]'    '
#
#Label7
#
$Label7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]92))
$Label7.Name = [System.String]'Label7'
$Label7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]179,[System.Int32]20))
$Label7.TabIndex = [System.Int32]5
$Label7.Text = [System.String]'Protection Status:'
$Label7.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#pbPercentEncrypted
#
$pbPercentEncrypted.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]204,[System.Int32]61))
$pbPercentEncrypted.Name = [System.String]'pbPercentEncrypted'
$pbPercentEncrypted.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]388,[System.Int32]23))
$pbPercentEncrypted.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$pbPercentEncrypted.TabIndex = [System.Int32]4
#
#lblPercentEncrypted
#
$lblPercentEncrypted.AutoSize = $true
$lblPercentEncrypted.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]204,[System.Int32]36))
$lblPercentEncrypted.Name = [System.String]'lblPercentEncrypted'
$lblPercentEncrypted.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblPercentEncrypted.TabIndex = [System.Int32]3
$lblPercentEncrypted.Text = [System.String]'    '
#
#Label6
#
$Label6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]36))
$Label6.Name = [System.String]'Label6'
$Label6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]179,[System.Int32]20))
$Label6.TabIndex = [System.Int32]2
$Label6.Text = [System.String]'% Encrypted:'
$Label6.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#lblConversionStatus
#
$lblConversionStatus.AutoSize = $true
$lblConversionStatus.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]204,[System.Int32]12))
$lblConversionStatus.Name = [System.String]'lblConversionStatus'
$lblConversionStatus.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblConversionStatus.TabIndex = [System.Int32]1
$lblConversionStatus.Text = [System.String]'    '
#
#Label5
#
$Label5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]12))
$Label5.Name = [System.String]'Label5'
$Label5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]179,[System.Int32]23))
$Label5.TabIndex = [System.Int32]0
$Label5.Text = [System.String]'Conversion Status:'
$Label5.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#Label1
#
$Label1.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]84,[System.Int32]16))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]198,[System.Int32]20))
$Label1.TabIndex = [System.Int32]0
$Label1.Text = [System.String]'Device ID:'
$Label1.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#lblDeviceId
#
$lblDeviceId.Anchor = [System.Windows.Forms.AnchorStyles]::None
$lblDeviceId.AutoSize = $true
$lblDeviceId.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]288,[System.Int32]16))
$lblDeviceId.Name = [System.String]'lblDeviceId'
$lblDeviceId.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblDeviceId.TabIndex = [System.Int32]1
$lblDeviceId.Text = [System.String]'    '
#
#lblPersistentVolumeId
#
$lblPersistentVolumeId.Anchor = [System.Windows.Forms.AnchorStyles]::None
$lblPersistentVolumeId.AutoSize = $true
$lblPersistentVolumeId.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]288,[System.Int32]41))
$lblPersistentVolumeId.Name = [System.String]'lblPersistentVolumeId'
$lblPersistentVolumeId.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblPersistentVolumeId.TabIndex = [System.Int32]3
$lblPersistentVolumeId.Text = [System.String]'    '
#
#Label3
#
$Label3.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Label3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]84,[System.Int32]41))
$Label3.Name = [System.String]'Label3'
$Label3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]198,[System.Int32]23))
$Label3.TabIndex = [System.Int32]2
$Label3.Text = [System.String]'Persistent Volume ID:'
$Label3.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#tmrEncryptionProgress
#
$tmrEncryptionProgress.add_Tick($tmrEncryptionProgress_Tick)
#
#Panel2
#
$Panel2.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Panel2.Controls.Add($lblNewPassword)
$Panel2.Controls.Add($Label8)
$Panel2.Controls.Add($lblNewProtectorId)
$Panel2.Controls.Add($Label4)
$Panel2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]14,[System.Int32]212))
$Panel2.Name = [System.String]'Panel2'
$Panel2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]755,[System.Int32]67))
$Panel2.TabIndex = [System.Int32]7
$Panel2.Visible = $false
#
#Label4
#
$Label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]10))
$Label4.Name = [System.String]'Label4'
$Label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]179,[System.Int32]22))
$Label4.TabIndex = [System.Int32]0
$Label4.Text = [System.String]'Key Protector Identifier:'
$Label4.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#lblNewProtectorId
#
$lblNewProtectorId.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]204,[System.Int32]10))
$lblNewProtectorId.Name = [System.String]'lblNewProtectorId'
$lblNewProtectorId.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]538,[System.Int32]23))
$lblNewProtectorId.TabIndex = [System.Int32]1
#
#Label8
#
$Label8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]37))
$Label8.Name = [System.String]'Label8'
$Label8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]179,[System.Int32]23))
$Label8.TabIndex = [System.Int32]2
$Label8.Text = [System.String]'Recovery Password:'
$Label8.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#lblNewPassword
#
$lblNewPassword.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]204,[System.Int32]37))
$lblNewPassword.Name = [System.String]'lblNewPassword'
$lblNewPassword.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]538,[System.Int32]23))
$lblNewPassword.TabIndex = [System.Int32]3
#
#BDEGUIEncryptForm
#
$BDEGUIEncryptForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]345))
$BDEGUIEncryptForm.Controls.Add($InfoBodyPanel)
$BDEGUIEncryptForm.Controls.Add($InfoHeaderPanel)
$BDEGUIEncryptForm.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BDEGUIEncryptForm.ForeColor = [System.Drawing.Color]::Black
$BDEGUIEncryptForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$BDEGUIEncryptForm.MaximizeBox = $false
$BDEGUIEncryptForm.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]800,[System.Int32]384))
$BDEGUIEncryptForm.ShowIcon = $false
$BDEGUIEncryptForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$BDEGUIEncryptForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$BDEGUIEncryptForm.Text = [System.String]'Encrypt Volume'
$BDEGUIEncryptForm.add_Load($BDEGUIUnlockForm_Load)
$InfoHeaderPanel.ResumeLayout($false)
$EncryptionControlsTLP.ResumeLayout($false)
$InfoBodyPanel.ResumeLayout($false)
$InfoBodyPanel.PerformLayout()
$Panel1.ResumeLayout($false)
$Panel1.PerformLayout()
$Panel2.ResumeLayout($false)
$BDEGUIEncryptForm.ResumeLayout($false)
Add-Member -InputObject $BDEGUIEncryptForm -Name Label2 -Value $Label2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name VolumesComboBox -Value $VolumesComboBox -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Refresh_Button -Value $Refresh_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name InfoHeaderPanel -Value $InfoHeaderPanel -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name EncryptionControlsTLP -Value $EncryptionControlsTLP -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name PauseEncryption_Button -Value $PauseEncryption_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name ResumeEncryption_Button -Value $ResumeEncryption_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Encrypt_Button -Value $Encrypt_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name InfoBodyPanel -Value $InfoBodyPanel -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Panel2 -Value $Panel2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name lblNewPassword -Value $lblNewPassword -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Label8 -Value $Label8 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name lblNewProtectorId -Value $lblNewProtectorId -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Label4 -Value $Label4 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Panel1 -Value $Panel1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name lblProtectionStatus -Value $lblProtectionStatus -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Label7 -Value $Label7 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name pbPercentEncrypted -Value $pbPercentEncrypted -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name lblPercentEncrypted -Value $lblPercentEncrypted -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Label6 -Value $Label6 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name lblConversionStatus -Value $lblConversionStatus -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Label5 -Value $Label5 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name lblDeviceId -Value $lblDeviceId -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name lblPersistentVolumeId -Value $lblPersistentVolumeId -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name Label3 -Value $Label3 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name tmrEncryptionProgress -Value $tmrEncryptionProgress -MemberType NoteProperty
Add-Member -InputObject $BDEGUIEncryptForm -Name components -Value $components -MemberType NoteProperty
}
. InitializeComponent
