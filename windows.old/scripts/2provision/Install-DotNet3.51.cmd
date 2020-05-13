@ECHO OFF
setlocal

:SETUP
set "INSTALL_URL=https://download.microsoft.com/download/2/0/E/20E90413-712F-438C-988E-FDAA79A8AC3D/dotnetfx35.exe"
set "TOINSTALL=%TEMP%\dotnetfx35.exe"

:MAIN
ECHO.
ECHO FILE URL:   "%INSTALL_URL%"
ECHO SAVING TO:  "%TOINSTALL%"
ECHO.
CALL :DOWNLOAD_FILE "%INSTALL_URL%" "%TOINSTALL%"
ECHO Finished downloading "%TOINSTALL%"

:INSTALL
ECHO Installing "%TOINSTALL%"
START "Install .NET 3.5.1" /D %TEMP% /WAIT "%TOINSTALL%" /q /norestart
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

