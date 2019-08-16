@ECHO OFF
setlocal

:SETUP
    
set "WMF3_URL=http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.0-KB2506146-x86.msu"

set "KB2506146=%TEMP%\Windows6.0-KB2506146-x86.msu"

:MAIN

ECHO.
ECHO FILE URL:   "%WMF3_URL%"
ECHO SAVING TO:  "%KB2506146%"
ECHO.

CALL :DOWNLOAD_FILE "%WMF3_URL%" "%KB2506146%"
ECHO Finished downloading "%KB2506146%"

:INSTALL
ECHO Installing "%KB2506146%"
START "Install WMF3.0" /D %TEMP% /WAIT "%KB2506146%" /QUIET
EXIT /B


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

