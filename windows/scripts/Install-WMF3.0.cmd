@ECHO OFF
setlocal

:SETUP
:: get windows version
for /f "tokens=2 delims=[]" %%G in ('ver') do (set _version=%%G) 
for /f "tokens=2,3,4 delims=. " %%G in ('echo %_version%') do (set _major=%%G& set _minor=%%H& set _build=%%I) 

:: 6.0 or 6.1
if %_major% neq 6 GOTO :EOF
if %_minor% lss 0 GOTO :EOF
if %_minor% gtr 1 GOTO :EOF

if %_minor% eq 1 (
    set "WMF3_URL=http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu"
    set "WMF3_INSTALL=%TEMP%\Windows6.1-KB2506143-x64.msu"
    GOTO :MAIN
) else (
    if defined ProgramFiles(x86) (
        set "WMF3_URL=http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.0-KB2506146-x64.msu"
        set "WMF3_INSTALL=%TEMP%\Windows6.0-KB2506146-x64.msu"
        GOTO :MAIN
    ) else (
        set "WMF3_URL=http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.0-KB2506146-x86.msu"
        set "WMF3_INSTALL=%TEMP%\Windows6.0-KB2506146-x86.msu"
        GOTO :MAIN
    )
)

:MAIN
    ECHO.
    ECHO FILE URL:   "%WMF3_URL%"
    ECHO SAVING TO:  "%WMF3_INSTALL%"
    ECHO.
    CALL :DOWNLOAD_FILE "%WMF3_URL%" "%WMF3_INSTALL%"
    ECHO Finished downloading "%WMF3_INSTALL%"
GOTO :INSTALL

:INSTALL
    ECHO Installing "%WMF3_INSTALL%"
    START "Install WMF3.0" /D %TEMP% /WAIT WUSA.EXE "%WMF3_INSTALL%" /QUIET /NORESTART
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

:EOF
