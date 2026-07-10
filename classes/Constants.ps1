# Constants for Win32_EncryptableVolume WMI Methods
#---------------------------------------------------

# Refer to Win32_EncryptableVolume method documentation to learn about error codes:
# https://learn.microsoft.com/en-us/windows/win32/secprov/win32-encryptablevolume

$S_OK = 0
$E_FAIL = 0x80004005
$E_ACCESS_DENIED = 2147942405
$FVE_E_LOCKED_VOLUME = 2150694912
$FVE_E_NOT_ENCRYPTED = 2150694913
$FVE_E_NOT_ACTIVATED = 2150694920
$FVE_E_PROTECTION_DISABLED = 2150694945
$FVE_E_RECOVERY_KEY_REQUIRED = 2150694946
$FVE_E_FAILED_AUTHENTICATION = 2150694951
$FVE_E_PROTECTOR_NOT_FOUND = 2150694963
$FVE_E_INVALID_PASSWORD_FORMAT = 2150694965