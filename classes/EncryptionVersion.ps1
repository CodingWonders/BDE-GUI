enum EncryptionVersion {
    # Either unknown encryption on volume or no encryption at all.
    Unknown = 0
    # Encryption from Windows Vista (Enterprise, Ultimate)/Server 2008.
    Vista = 1
    # Encryption from Windows 7 onwards.
    Seven = 2
}