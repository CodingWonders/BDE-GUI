$BDEGUIUnlockForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.Label]$Label2 = $null
[System.Windows.Forms.ComboBox]$ComboBox1 = $null
[System.Windows.Forms.Label]$Label3 = $null
[System.Windows.Forms.TextBox]$RPS1 = $null
[System.Windows.Forms.Label]$Label4 = $null
[System.Windows.Forms.Label]$Label5 = $null
[System.Windows.Forms.TextBox]$RPS2 = $null
[System.Windows.Forms.TextBox]$RPS3 = $null
[System.Windows.Forms.Label]$Label6 = $null
[System.Windows.Forms.TextBox]$RPS4 = $null
[System.Windows.Forms.TextBox]$RPS5 = $null
[System.Windows.Forms.TextBox]$RPS6 = $null
[System.Windows.Forms.TextBox]$RPS7 = $null
[System.Windows.Forms.TextBox]$RPS8 = $null
[System.Windows.Forms.Label]$Label7 = $null
[System.Windows.Forms.Label]$Label8 = $null
[System.Windows.Forms.Label]$Label9 = $null
[System.Windows.Forms.Label]$Label10 = $null
[System.Windows.Forms.Button]$OK_Button = $null
[System.Windows.Forms.Button]$Cancel_Button = $null
function InitializeComponent
{
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$Label2 = (New-Object -TypeName System.Windows.Forms.Label)
$ComboBox1 = (New-Object -TypeName System.Windows.Forms.ComboBox)
$Label3 = (New-Object -TypeName System.Windows.Forms.Label)
$RPS1 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Label4 = (New-Object -TypeName System.Windows.Forms.Label)
$Label5 = (New-Object -TypeName System.Windows.Forms.Label)
$RPS2 = (New-Object -TypeName System.Windows.Forms.TextBox)
$RPS3 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Label6 = (New-Object -TypeName System.Windows.Forms.Label)
$RPS4 = (New-Object -TypeName System.Windows.Forms.TextBox)
$RPS5 = (New-Object -TypeName System.Windows.Forms.TextBox)
$RPS6 = (New-Object -TypeName System.Windows.Forms.TextBox)
$RPS7 = (New-Object -TypeName System.Windows.Forms.TextBox)
$RPS8 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Label7 = (New-Object -TypeName System.Windows.Forms.Label)
$Label8 = (New-Object -TypeName System.Windows.Forms.Label)
$Label9 = (New-Object -TypeName System.Windows.Forms.Label)
$Label10 = (New-Object -TypeName System.Windows.Forms.Label)
$OK_Button = (New-Object -TypeName System.Windows.Forms.Button)
$Cancel_Button = (New-Object -TypeName System.Windows.Forms.Button)
$BDEGUIUnlockForm.SuspendLayout()
#
#Label1
#
$Label1.AutoSize = $true
$Label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]258,[System.Int32]20))
$Label1.TabIndex = [System.Int32]0
$Label1.Text = [System.String]'Unlock a BitLocker-encrypted drive.'
#
#Label2
#
$Label2.AutoSize = $true
$Label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]118,[System.Int32]39))
$Label2.Name = [System.String]'Label2'
$Label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]127,[System.Int32]20))
$Label2.TabIndex = [System.Int32]1
$Label2.Text = [System.String]'Volume to unlock:'
#
#ComboBox1
#
$ComboBox1.FormattingEnabled = $true
$ComboBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]251,[System.Int32]36))
$ComboBox1.Name = [System.String]'ComboBox1'
$ComboBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]383,[System.Int32]28))
$ComboBox1.TabIndex = [System.Int32]2
#
#Label3
#
$Label3.AutoSize = $true
$Label3.BackColor = [System.Drawing.SystemColors]::Control
$Label3.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label3.ForeColor = [System.Drawing.Color]::Black
$Label3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]72))
$Label3.Name = [System.String]'Label3'
$Label3.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]219,[System.Int32]20))
$Label3.TabIndex = [System.Int32]0
$Label3.Text = [System.String]'Type your 48-digit recovery key:'
#
#RPS1
#
$RPS1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]11,[System.Int32]107))
$RPS1.MaxLength = [System.Int32]6
$RPS1.Name = [System.String]'RPS1'
$RPS1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS1.TabIndex = [System.Int32]3
$RPS1.add_TextChanged($RPS1_TextChanged)
#
#Label4
#
$Label4.AutoSize = $true
$Label4.BackColor = [System.Drawing.SystemColors]::Control
$Label4.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label4.ForeColor = [System.Drawing.Color]::Black
$Label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]89,[System.Int32]110))
$Label4.Name = [System.String]'Label4'
$Label4.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]15,[System.Int32]20))
$Label4.TabIndex = [System.Int32]0
$Label4.Text = [System.String]'-'
#
#Label5
#
$Label5.AutoSize = $true
$Label5.BackColor = [System.Drawing.SystemColors]::Control
$Label5.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label5.ForeColor = [System.Drawing.Color]::Black
$Label5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]188,[System.Int32]110))
$Label5.Name = [System.String]'Label5'
$Label5.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]15,[System.Int32]20))
$Label5.TabIndex = [System.Int32]0
$Label5.Text = [System.String]'-'
#
#RPS2
#
$RPS2.BackColor = [System.Drawing.SystemColors]::Window
$RPS2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$RPS2.ForeColor = [System.Drawing.SystemColors]::WindowText
$RPS2.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$RPS2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]110,[System.Int32]107))
$RPS2.MaxLength = [System.Int32]6
$RPS2.Name = [System.String]'RPS2'
$RPS2.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$RPS2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS2.TabIndex = [System.Int32]3
$RPS2.add_TextChanged($RPS2_TextChanged)
#
#RPS3
#
$RPS3.BackColor = [System.Drawing.SystemColors]::Window
$RPS3.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$RPS3.ForeColor = [System.Drawing.SystemColors]::WindowText
$RPS3.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$RPS3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]209,[System.Int32]107))
$RPS3.MaxLength = [System.Int32]6
$RPS3.Name = [System.String]'RPS3'
$RPS3.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$RPS3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS3.TabIndex = [System.Int32]3
$RPS3.add_TextChanged($RPS3_TextChanged)
#
#Label6
#
$Label6.AutoSize = $true
$Label6.BackColor = [System.Drawing.SystemColors]::Control
$Label6.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label6.ForeColor = [System.Drawing.Color]::Black
$Label6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]287,[System.Int32]110))
$Label6.Name = [System.String]'Label6'
$Label6.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]15,[System.Int32]20))
$Label6.TabIndex = [System.Int32]0
$Label6.Text = [System.String]'-'
#
#RPS4
#
$RPS4.BackColor = [System.Drawing.SystemColors]::Window
$RPS4.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$RPS4.ForeColor = [System.Drawing.SystemColors]::WindowText
$RPS4.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$RPS4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]308,[System.Int32]107))
$RPS4.MaxLength = [System.Int32]6
$RPS4.Name = [System.String]'RPS4'
$RPS4.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$RPS4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS4.TabIndex = [System.Int32]3
$RPS4.add_TextChanged($RPS4_TextChanged)
#
#RPS5
#
$RPS5.BackColor = [System.Drawing.SystemColors]::Window
$RPS5.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$RPS5.ForeColor = [System.Drawing.SystemColors]::WindowText
$RPS5.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$RPS5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]407,[System.Int32]107))
$RPS5.MaxLength = [System.Int32]6
$RPS5.Name = [System.String]'RPS5'
$RPS5.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$RPS5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS5.TabIndex = [System.Int32]3
$RPS5.add_TextChanged($RPS5_TextChanged)
#
#RPS6
#
$RPS6.BackColor = [System.Drawing.SystemColors]::Window
$RPS6.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$RPS6.ForeColor = [System.Drawing.SystemColors]::WindowText
$RPS6.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$RPS6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]506,[System.Int32]107))
$RPS6.MaxLength = [System.Int32]6
$RPS6.Name = [System.String]'RPS6'
$RPS6.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$RPS6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS6.TabIndex = [System.Int32]3
$RPS6.add_TextChanged($RPS6_TextChanged)
#
#RPS7
#
$RPS7.BackColor = [System.Drawing.SystemColors]::Window
$RPS7.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$RPS7.ForeColor = [System.Drawing.SystemColors]::WindowText
$RPS7.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$RPS7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]605,[System.Int32]107))
$RPS7.MaxLength = [System.Int32]6
$RPS7.Name = [System.String]'RPS7'
$RPS7.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$RPS7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS7.TabIndex = [System.Int32]3
$RPS7.add_TextChanged($RPS7_TextChanged)
#
#RPS8
#
$RPS8.BackColor = [System.Drawing.SystemColors]::Window
$RPS8.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$RPS8.ForeColor = [System.Drawing.SystemColors]::WindowText
$RPS8.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$RPS8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]704,[System.Int32]107))
$RPS8.MaxLength = [System.Int32]6
$RPS8.Name = [System.String]'RPS8'
$RPS8.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$RPS8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]72,[System.Int32]27))
$RPS8.TabIndex = [System.Int32]3
$RPS8.add_TextChanged($RPS8_TextChanged)
#
#Label7
#
$Label7.AutoSize = $true
$Label7.BackColor = [System.Drawing.SystemColors]::Control
$Label7.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label7.ForeColor = [System.Drawing.Color]::Black
$Label7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]386,[System.Int32]110))
$Label7.Name = [System.String]'Label7'
$Label7.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]15,[System.Int32]20))
$Label7.TabIndex = [System.Int32]0
$Label7.Text = [System.String]'-'
#
#Label8
#
$Label8.AutoSize = $true
$Label8.BackColor = [System.Drawing.SystemColors]::Control
$Label8.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label8.ForeColor = [System.Drawing.Color]::Black
$Label8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]485,[System.Int32]110))
$Label8.Name = [System.String]'Label8'
$Label8.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]15,[System.Int32]20))
$Label8.TabIndex = [System.Int32]0
$Label8.Text = [System.String]'-'
#
#Label9
#
$Label9.AutoSize = $true
$Label9.BackColor = [System.Drawing.SystemColors]::Control
$Label9.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label9.ForeColor = [System.Drawing.Color]::Black
$Label9.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]584,[System.Int32]110))
$Label9.Name = [System.String]'Label9'
$Label9.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label9.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]15,[System.Int32]20))
$Label9.TabIndex = [System.Int32]0
$Label9.Text = [System.String]'-'
#
#Label10
#
$Label10.AutoSize = $true
$Label10.BackColor = [System.Drawing.SystemColors]::Control
$Label10.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25))
$Label10.ForeColor = [System.Drawing.Color]::Black
$Label10.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]683,[System.Int32]110))
$Label10.Name = [System.String]'Label10'
$Label10.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label10.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]15,[System.Int32]20))
$Label10.TabIndex = [System.Int32]0
$Label10.Text = [System.String]'-'
#
#OK_Button
#
$OK_Button.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom
$OK_Button.Enabled = $false
$OK_Button.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OK_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]315,[System.Int32]150))
$OK_Button.Name = [System.String]'OK_Button'
$OK_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]29))
$OK_Button.TabIndex = [System.Int32]4
$OK_Button.Text = [System.String]'OK'
$OK_Button.UseVisualStyleBackColor = $true
#
#Cancel_Button
#
$Cancel_Button.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom
$Cancel_Button.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Cancel_Button.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$Cancel_Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]396,[System.Int32]150))
$Cancel_Button.Name = [System.String]'Cancel_Button'
$Cancel_Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]29))
$Cancel_Button.TabIndex = [System.Int32]5
$Cancel_Button.Text = [System.String]'Cancel'
$Cancel_Button.UseVisualStyleBackColor = $true
#
#BDEGUIUnlockForm
#
$BDEGUIUnlockForm.AcceptButton = $OK_Button
$BDEGUIUnlockForm.CancelButton = $Cancel_Button
$BDEGUIUnlockForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784,[System.Int32]191))
$BDEGUIUnlockForm.Controls.Add($Cancel_Button)
$BDEGUIUnlockForm.Controls.Add($OK_Button)
$BDEGUIUnlockForm.Controls.Add($RPS1)
$BDEGUIUnlockForm.Controls.Add($ComboBox1)
$BDEGUIUnlockForm.Controls.Add($Label2)
$BDEGUIUnlockForm.Controls.Add($Label1)
$BDEGUIUnlockForm.Controls.Add($Label3)
$BDEGUIUnlockForm.Controls.Add($Label4)
$BDEGUIUnlockForm.Controls.Add($Label5)
$BDEGUIUnlockForm.Controls.Add($RPS2)
$BDEGUIUnlockForm.Controls.Add($RPS3)
$BDEGUIUnlockForm.Controls.Add($Label6)
$BDEGUIUnlockForm.Controls.Add($RPS4)
$BDEGUIUnlockForm.Controls.Add($RPS5)
$BDEGUIUnlockForm.Controls.Add($RPS6)
$BDEGUIUnlockForm.Controls.Add($RPS7)
$BDEGUIUnlockForm.Controls.Add($RPS8)
$BDEGUIUnlockForm.Controls.Add($Label7)
$BDEGUIUnlockForm.Controls.Add($Label8)
$BDEGUIUnlockForm.Controls.Add($Label9)
$BDEGUIUnlockForm.Controls.Add($Label10)
$BDEGUIUnlockForm.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BDEGUIUnlockForm.ForeColor = [System.Drawing.Color]::Black
$BDEGUIUnlockForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$BDEGUIUnlockForm.MaximizeBox = $false
$BDEGUIUnlockForm.MinimizeBox = $false
$BDEGUIUnlockForm.ShowIcon = $false
$BDEGUIUnlockForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$BDEGUIUnlockForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$BDEGUIUnlockForm.Text = [System.String]'Unlock Encrypted Drive'
$BDEGUIUnlockForm.ResumeLayout($false)
$BDEGUIUnlockForm.PerformLayout()
Add-Member -InputObject $BDEGUIUnlockForm -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label2 -Value $Label2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name ComboBox1 -Value $ComboBox1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label3 -Value $Label3 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS1 -Value $RPS1 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label4 -Value $Label4 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label5 -Value $Label5 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS2 -Value $RPS2 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS3 -Value $RPS3 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label6 -Value $Label6 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS4 -Value $RPS4 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS5 -Value $RPS5 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS6 -Value $RPS6 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS7 -Value $RPS7 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name RPS8 -Value $RPS8 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label7 -Value $Label7 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label8 -Value $Label8 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label9 -Value $Label9 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Label10 -Value $Label10 -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name OK_Button -Value $OK_Button -MemberType NoteProperty
Add-Member -InputObject $BDEGUIUnlockForm -Name Cancel_Button -Value $Cancel_Button -MemberType NoteProperty
}
. InitializeComponent
