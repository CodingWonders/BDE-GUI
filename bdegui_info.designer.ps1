$BDEGUIInfoForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$Label2 = $null
[System.Windows.Forms.ComboBox]$VolumesComboBox = $null
[System.Windows.Forms.Button]$Refresh_Button = $null
[System.Windows.Forms.Panel]$InfoHeaderPanel = $null
[System.Windows.Forms.Panel]$InfoBodyPanel = $null
[System.Windows.Forms.TabControl]$TabControl1 = $null
[System.Windows.Forms.TabPage]$TabPage1 = $null
[System.Windows.Forms.Label]$lblVersion = $null
[System.Windows.Forms.Label]$Label8 = $null
[System.Windows.Forms.Panel]$Panel1 = $null
[System.Windows.Forms.CheckBox]$cbRefreshConvStatus = $null
[System.Windows.Forms.Label]$lblProtectionStatus = $null
[System.Windows.Forms.Label]$Label7 = $null
[System.Windows.Forms.ProgressBar]$pbPercentEncrypted = $null
[System.Windows.Forms.Label]$lblPercentEncrypted = $null
[System.Windows.Forms.Label]$Label6 = $null
[System.Windows.Forms.Label]$lblConversionStatus = $null
[System.Windows.Forms.Label]$Label5 = $null
[System.Windows.Forms.Label]$lblVolumeLockStatus = $null
[System.Windows.Forms.Label]$Label4 = $null
[System.Windows.Forms.Label]$lblPersistentVolumeId = $null
[System.Windows.Forms.Label]$Label3 = $null
[System.Windows.Forms.Label]$lblDeviceId = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.TabPage]$TabPage2 = $null
[System.Windows.Forms.ListView]$lvProtectors = $null
[System.Windows.Forms.ColumnHeader]$ColumnHeader1 = $null
[System.Windows.Forms.ColumnHeader]$ColumnHeader2 = $null
[System.Windows.Forms.Timer]$tmrSynchro = $null
[System.ComponentModel.IContainer]$components = $null
function InitializeComponent
{
$components = (New-Object -TypeName System.ComponentModel.Container)
$Label2 = (New-Object -TypeName System.Windows.Forms.Label)
$VolumesComboBox = (New-Object -TypeName System.Windows.Forms.ComboBox)
$Refresh_Button = (New-Object -TypeName System.Windows.Forms.Button)
$InfoHeaderPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$InfoBodyPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$TabControl1 = (New-Object -TypeName System.Windows.Forms.TabControl)
$TabPage1 = (New-Object -TypeName System.Windows.Forms.TabPage)
$lblVersion = (New-Object -TypeName System.Windows.Forms.Label)
$Label8 = (New-Object -TypeName System.Windows.Forms.Label)
$Panel1 = (New-Object -TypeName System.Windows.Forms.Panel)
$lblProtectionStatus = (New-Object -TypeName System.Windows.Forms.Label)
$Label7 = (New-Object -TypeName System.Windows.Forms.Label)
$pbPercentEncrypted = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$lblPercentEncrypted = (New-Object -TypeName System.Windows.Forms.Label)
$Label6 = (New-Object -TypeName System.Windows.Forms.Label)
$lblConversionStatus = (New-Object -TypeName System.Windows.Forms.Label)
$Label5 = (New-Object -TypeName System.Windows.Forms.Label)
$lblVolumeLockStatus = (New-Object -TypeName System.Windows.Forms.Label)
$Label4 = (New-Object -TypeName System.Windows.Forms.Label)
$lblPersistentVolumeId = (New-Object -TypeName System.Windows.Forms.Label)
$Label3 = (New-Object -TypeName System.Windows.Forms.Label)
$lblDeviceId = (New-Object -TypeName System.Windows.Forms.Label)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$TabPage2 = (New-Object -TypeName System.Windows.Forms.TabPage)
$lvProtectors = (New-Object -TypeName System.Windows.Forms.ListView)
$ColumnHeader1 = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$ColumnHeader2 = (New-Object -TypeName System.Windows.Forms.ColumnHeader)
$cbRefreshConvStatus = (New-Object -TypeName System.Windows.Forms.CheckBox)
$tmrSynchro = (New-Object -TypeName System.Windows.Forms.Timer -ArgumentList @($components))
$InfoHeaderPanel.SuspendLayout()
$InfoBodyPanel.SuspendLayout()
$TabControl1.SuspendLayout()
$TabPage1.SuspendLayout()
$Panel1.SuspendLayout()
$TabPage2.SuspendLayout()
$BDEGUIInfoForm.SuspendLayout()
#
#Label2
#
$Label2.Anchor = [System.Windows.Forms.AnchorStyles]::Top
$Label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]98,[System.Int32]15))
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
$VolumesComboBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]207,[System.Int32]12))
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
$Refresh_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]596,[System.Int32]11))
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
$InfoHeaderPanel.Controls.Add($VolumesComboBox)
$InfoHeaderPanel.Controls.Add($Refresh_Button)
$InfoHeaderPanel.Controls.Add($Label2)
$InfoHeaderPanel.Dock = [System.Windows.Forms.DockStyle]::Top
$InfoHeaderPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$InfoHeaderPanel.Name = [System.String]'InfoHeaderPanel'
$InfoHeaderPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]48))
$InfoHeaderPanel.TabIndex = [System.Int32]6
#
#InfoBodyPanel
#
$InfoBodyPanel.Controls.Add($TabControl1)
$InfoBodyPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$InfoBodyPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]48))
$InfoBodyPanel.Name = [System.String]'InfoBodyPanel'
$InfoBodyPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]393))
$InfoBodyPanel.TabIndex = [System.Int32]7
#
#TabControl1
#
$TabControl1.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$TabControl1.Controls.Add($TabPage1)
$TabControl1.Controls.Add($TabPage2)
$TabControl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]6))
$TabControl1.Name = [System.String]'TabControl1'
$TabControl1.SelectedIndex = [System.Int32]0
$TabControl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]760,[System.Int32]375))
$TabControl1.TabIndex = [System.Int32]0
#
#TabPage1
#
$TabPage1.Controls.Add($lblVersion)
$TabPage1.Controls.Add($Label8)
$TabPage1.Controls.Add($Panel1)
$TabPage1.Controls.Add($lblVolumeLockStatus)
$TabPage1.Controls.Add($Label4)
$TabPage1.Controls.Add($lblPersistentVolumeId)
$TabPage1.Controls.Add($Label3)
$TabPage1.Controls.Add($lblDeviceId)
$TabPage1.Controls.Add($Label1)
$TabPage1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]4,[System.Int32]29))
$TabPage1.Name = [System.String]'TabPage1'
$TabPage1.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
$TabPage1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]752,[System.Int32]342))
$TabPage1.TabIndex = [System.Int32]0
$TabPage1.Text = [System.String]'General Information'
$TabPage1.UseVisualStyleBackColor = $true
#
#lblVersion
#
$lblVersion.Anchor = [System.Windows.Forms.AnchorStyles]::None
$lblVersion.AutoSize = $true
$lblVersion.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]267,[System.Int32]262))
$lblVersion.Name = [System.String]'lblVersion'
$lblVersion.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblVersion.TabIndex = [System.Int32]8
$lblVersion.Text = [System.String]'    '
#
#Label8
#
$Label8.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Label8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]63,[System.Int32]262))
$Label8.Name = [System.String]'Label8'
$Label8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]198,[System.Int32]22))
$Label8.TabIndex = [System.Int32]7
$Label8.Text = [System.String]'Version:'
$Label8.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#Panel1
#
$Panel1.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Panel1.Controls.Add($cbRefreshConvStatus)
$Panel1.Controls.Add($lblProtectionStatus)
$Panel1.Controls.Add($Label7)
$Panel1.Controls.Add($pbPercentEncrypted)
$Panel1.Controls.Add($lblPercentEncrypted)
$Panel1.Controls.Add($Label6)
$Panel1.Controls.Add($lblConversionStatus)
$Panel1.Controls.Add($Label5)
$Panel1.Enabled = $false
$Panel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]63,[System.Int32]119))
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
#lblVolumeLockStatus
#
$lblVolumeLockStatus.Anchor = [System.Windows.Forms.AnchorStyles]::None
$lblVolumeLockStatus.AutoSize = $true
$lblVolumeLockStatus.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]267,[System.Int32]92))
$lblVolumeLockStatus.Name = [System.String]'lblVolumeLockStatus'
$lblVolumeLockStatus.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblVolumeLockStatus.TabIndex = [System.Int32]5
$lblVolumeLockStatus.Text = [System.String]'    '
#
#Label4
#
$Label4.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]63,[System.Int32]92))
$Label4.Name = [System.String]'Label4'
$Label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]198,[System.Int32]23))
$Label4.TabIndex = [System.Int32]4
$Label4.Text = [System.String]'Lock Status:'
$Label4.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#lblPersistentVolumeId
#
$lblPersistentVolumeId.Anchor = [System.Windows.Forms.AnchorStyles]::None
$lblPersistentVolumeId.AutoSize = $true
$lblPersistentVolumeId.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]267,[System.Int32]57))
$lblPersistentVolumeId.Name = [System.String]'lblPersistentVolumeId'
$lblPersistentVolumeId.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblPersistentVolumeId.TabIndex = [System.Int32]3
$lblPersistentVolumeId.Text = [System.String]'    '
#
#Label3
#
$Label3.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Label3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]63,[System.Int32]57))
$Label3.Name = [System.String]'Label3'
$Label3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]198,[System.Int32]23))
$Label3.TabIndex = [System.Int32]2
$Label3.Text = [System.String]'Persistent Volume ID:'
$Label3.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#lblDeviceId
#
$lblDeviceId.Anchor = [System.Windows.Forms.AnchorStyles]::None
$lblDeviceId.AutoSize = $true
$lblDeviceId.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]267,[System.Int32]32))
$lblDeviceId.Name = [System.String]'lblDeviceId'
$lblDeviceId.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]25,[System.Int32]20))
$lblDeviceId.TabIndex = [System.Int32]1
$lblDeviceId.Text = [System.String]'    '
#
#Label1
#
$Label1.Anchor = [System.Windows.Forms.AnchorStyles]::None
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]63,[System.Int32]32))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]198,[System.Int32]20))
$Label1.TabIndex = [System.Int32]0
$Label1.Text = [System.String]'Device ID:'
$Label1.TextAlign = [System.Drawing.ContentAlignment]::TopRight
#
#TabPage2
#
$TabPage2.Controls.Add($lvProtectors)
$TabPage2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]4,[System.Int32]22))
$TabPage2.Name = [System.String]'TabPage2'
$TabPage2.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
$TabPage2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]752,[System.Int32]349))
$TabPage2.TabIndex = [System.Int32]1
$TabPage2.Text = [System.String]'Key Protectors'
$TabPage2.UseVisualStyleBackColor = $true
#
#lvProtectors
#
$lvProtectors.Columns.AddRange([System.Windows.Forms.ColumnHeader[]]@($ColumnHeader1,$ColumnHeader2))
$lvProtectors.Dock = [System.Windows.Forms.DockStyle]::Fill
$lvProtectors.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]3))
$lvProtectors.Name = [System.String]'lvProtectors'
$lvProtectors.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]746,[System.Int32]343))
$lvProtectors.TabIndex = [System.Int32]0
$lvProtectors.UseCompatibleStateImageBehavior = $false
$lvProtectors.View = [System.Windows.Forms.View]::Details
#
#ColumnHeader1
#
$ColumnHeader1.Text = [System.String]'Protector ID'
$ColumnHeader1.Width = [System.Int32]384
#
#ColumnHeader2
#
$ColumnHeader2.Text = [System.String]'Protector Type'
$ColumnHeader2.Width = [System.Int32]192
#
#cbRefreshConvStatus
#
$cbRefreshConvStatus.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]386,[System.Int32]34))
$cbRefreshConvStatus.Name = [System.String]'cbRefreshConvStatus'
$cbRefreshConvStatus.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]206,[System.Int32]26))
$cbRefreshConvStatus.TabIndex = [System.Int32]7
$cbRefreshConvStatus.Text = [System.String]'Automatically Refesh Data'
$cbRefreshConvStatus.UseVisualStyleBackColor = $true
$cbRefreshConvStatus.add_CheckedChanged($cbRefreshConvStatus_CheckedChanged)
#
#tmrSynchro
#
$tmrSynchro.Interval = [System.Int32]500
$tmrSynchro.add_Tick($tmrSynchro_Tick)
#
#BDEGUIInfoForm
#
$BDEGUIInfoForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]441))
$BDEGUIInfoForm.Controls.Add($InfoBodyPanel)
$BDEGUIInfoForm.Controls.Add($InfoHeaderPanel)
$BDEGUIInfoForm.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BDEGUIInfoForm.ForeColor = [System.Drawing.Color]::Black
$BDEGUIInfoForm.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]800,[System.Int32]480))
$BDEGUIInfoForm.ShowIcon = $false
$BDEGUIInfoForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$BDEGUIInfoForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$BDEGUIInfoForm.Text = [System.String]'Query Encrypted Volume Information'
$BDEGUIInfoForm.add_Load($BDEGUIUnlockForm_Load)
$InfoHeaderPanel.ResumeLayout($false)
$InfoBodyPanel.ResumeLayout($false)
$TabControl1.ResumeLayout($false)
$TabPage1.ResumeLayout($false)
$TabPage1.PerformLayout()
$Panel1.ResumeLayout($false)
$Panel1.PerformLayout()
$TabPage2.ResumeLayout($false)
$BDEGUIInfoForm.ResumeLayout($false)
Add-Member -InputObject $BDEGUIInfoForm -Name Label2 -Value $Label2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name VolumesComboBox -Value $VolumesComboBox -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Refresh_Button -Value $Refresh_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name InfoHeaderPanel -Value $InfoHeaderPanel -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name InfoBodyPanel -Value $InfoBodyPanel -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name TabControl1 -Value $TabControl1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name TabPage1 -Value $TabPage1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lblVersion -Value $lblVersion -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Label8 -Value $Label8 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Panel1 -Value $Panel1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name cbRefreshConvStatus -Value $cbRefreshConvStatus -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lblProtectionStatus -Value $lblProtectionStatus -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Label7 -Value $Label7 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name pbPercentEncrypted -Value $pbPercentEncrypted -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lblPercentEncrypted -Value $lblPercentEncrypted -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Label6 -Value $Label6 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lblConversionStatus -Value $lblConversionStatus -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Label5 -Value $Label5 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lblVolumeLockStatus -Value $lblVolumeLockStatus -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Label4 -Value $Label4 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lblPersistentVolumeId -Value $lblPersistentVolumeId -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Label3 -Value $Label3 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lblDeviceId -Value $lblDeviceId -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name TabPage2 -Value $TabPage2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name lvProtectors -Value $lvProtectors -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name ColumnHeader1 -Value $ColumnHeader1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name ColumnHeader2 -Value $ColumnHeader2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name tmrSynchro -Value $tmrSynchro -MemberType NoteProperty
Add-Member -InputObject $BDEGUIInfoForm -Name components -Value $components -MemberType NoteProperty
}
. InitializeComponent
