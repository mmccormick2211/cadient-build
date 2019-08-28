@ECHO OFF
setlocal
PING -n 121 127.0.0.1>nul

:SETUP
set "INSTALL_URL=https://download.microsoft.com/download/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe"
set "TOINSTALL=%TEMP%\dotNetFx40_Full_x86_x64.exe"

:MAIN
ECHO.
ECHO FILE URL:   "%INSTALL_URL%"
ECHO SAVING TO:  "%TOINSTALL%"
ECHO.
CALL :DOWNLOAD_FILE "%INSTALL_URL%" "%TOINSTALL%"
ECHO Finished downloading "%TOINSTALL%"

:INSTALL
ECHO Installing "%TOINSTALL%"
START "Install .NET 4.0" /D %TEMP% /WAIT "%TOINSTALL%" /passive /norestart
shutdown /r /t 10 /f /d p:4:1 /c "Packer Reboot"
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

