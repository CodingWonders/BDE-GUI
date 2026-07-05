foreach ($clsFile in Get-ChildItem -Path "$PSScriptRoot\classes" -Filter "*.ps1") {
    . $clsFile
}

Write-Host $([EncryptionMethod]::XtsAes128)
Write-Host $([EncryptionVersion]::Vista)