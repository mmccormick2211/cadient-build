@ECHO OFF
setlocal

:SETUP
set "WMF2_URL=https://download.microsoft.com/download/F/9/E/F9EF6ACB-2BA8-4845-9C10-85FC4A69B207/Windows6.0-KB968930-x86.msu"
set "BITS4_URL=https://download.microsoft.com/download/8/F/9/8F917766-5CBA-4B9A-81FB-10A97E851392/Windows6.0-KB960568-x86.msu"

set "KB968930=%TEMP%\Windows6.0-KB968930-x86.msu"
set "KB960568=%TEMP%\Windows6.0-KB960568-x86.msu"

:MAIN

ECHO.
ECHO FILE URL:   "%WMF2_URL%"
ECHO SAVING TO:  "%KB968930%"
ECHO.

CALL :DOWNLOAD_FILE "%WMF2_URL%" "%KB968930%"
CALL :LOOP
ECHO Finished downloading "%KB968930%"

ECHO.
ECHO FILE URL:   "%BITS4_URL%"
ECHO SAVING TO:  "%KB960568%"
ECHO.

CALL :DOWNLOAD_FILE "%BITS4_URL%" "%KB960568%"
CALL :LOOP
ECHO Finished downloading "%KB960568%"

:LOOP
    Bitsadmin /info mydownloadjob /verbose | find "STATE: TRANSFERRED"
    IF %ERRORLEVEL% NEQ 0 CALL :LOOP
    IF %ERRORLEVEL% EQU 0 bitsadmin /complete mydownloadjob
    TIMEOUT /T 10 /NOBREAK
GOTO :EOF

:DOWNLOAD_FILE
    rem BITSADMIN COMMAND FOR DOWNLOADING FILES:
    bitsadmin /transfer mydownloadjob /download /priority FOREGROUND %1 %2
GOTO :EOF

:DOWNLOAD_PROXY_ON
    rem FUNCTION FOR USING A PROXY SERVER:
    bitsadmin /setproxysettings mydownloadjob OVERRIDE %1 "<local>"
GOTO :EOF

:DOWNLOAD_PROXY_OFF
    rem FUNCTION FOR STOP USING A PROXY SERVER:
    bitsadmin /setproxysettings mydownloadjob NO_PROXY
GOTO :EOF

