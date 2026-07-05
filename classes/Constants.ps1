# Constants for Win32_EncryptableVolume WMI Methods
#---------------------------------------------------

# The operation completed successfully.
# --- Thrown by all methods
$S_OK = 0

# BitLocker is not enabled on the volume. Add a key protector to enable BitLocker.
$FVE_E_NOT_ACTIVATED = 0x80310008
# The volume does not have a key protector of the type "Numerical Password". The NumericalPassword parameter has a valid format,
# but you cannot use a numerical password to unlock the volume.
$FVE_E_PROTECTOR_NOT_FOUND = 0x80310033
# The NumericalPassword parameter cannot unlock the volume. One or more key protectors of the type "Numerical Password" exist, but
# the specified NumericalPassword parameter cannot unlock the volume.
$FVE_E_FAILED_AUTHENTICATION = 0x80310027
# The NumericalPassword parameter does not have a valid format.
$FVE_E_INVALID_PASSWORD_FORMAT = 0x80310035