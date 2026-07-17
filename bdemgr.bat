@echo off

CD %~DP0

SET version=0.8.1

REM count arguments; if no arguments were passed, display help
SET ARGUMENTCOUNT=0
FOR %%X IN (%*) DO SET /A ARGUMENTCOUNT+=1

IF %ARGUMENTCOUNT% LSS 1 GOTO HELP

IF /I "%1" == "unlock" IF EXIST BDEGUI_Unlock.ps1 powershell -executionpolicy unrestricted -noprofile -nologo -file BDEGUI_Unlock.ps1 && GOTO EOF
IF /I "%1" == "lock" IF EXIST BDEGUI_Lock.ps1 powershell -executionpolicy unrestricted -noprofile -nologo -file BDEGUI_Lock.ps1 && GOTO EOF
IF /I "%1" == "info" IF EXIST BDEGUI_Info.ps1 powershell -executionpolicy unrestricted -noprofile -nologo -file BDEGUI_Info.ps1 && GOTO EOF
ECHO Unknown command: %1
ECHO.

:HELP
echo BitLocker Drive Encryption Manager - version %version%
echo.
echo     Available commands:
echo     - unlock -- unlocks an encrypted volume
echo     - lock -- locks a decrypted volume
echo     - info -- queries information about an encryptable volume
echo     - encrypt -- encrypts a volume (turns on BitLocker for the volume)
echo     - decrypt -- decrypts a volume (turns off BitLocker for the volume)
echo.

:EOF