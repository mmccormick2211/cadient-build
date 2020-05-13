SETLOCAL
SET chocolateyProxyLocation = 'http://pdxproxy.dmz.unicru.com:8080'
SET chocolateyProxyUser     = 'svc_proxy'
SET chocolateyProxyPassword = 'P2ss4PROXY'
: # install script
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SETX "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
ENDLOCAL

