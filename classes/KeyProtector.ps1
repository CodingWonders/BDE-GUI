class KeyProtector {
    [string] $ProtectorId
    [KeyProtectorType] $ProtectorType
    [UInt32] $ProtectorFlags
}

enum KeyProtectorType {
    # Unknown or other protector type
    Unknown = 0
    # Trusted Platform Module (TPM)
    TPM = 1
    # External key
    ExternalKey = 2
    # Numerical password
    NumericalPassword = 3
    # TPM & PIN
    TPMPin = 4
    # TPM & Startup Key
    TPMStartupKey = 5
    # TPM & PIN & Startup Key
    TPMPinStartupKey = 6
    # Public Key
    PublicKey = 7
    # Passphrase
    Passphrase = 8
    # TPM Certificate
    TPMCert = 9
    # CryptoAPI Next Generation (CNG) Protector
    CNG = 10
}