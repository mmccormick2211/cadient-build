%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ /v EnableAutoTray /t REG_DWORD /d 0 /f
:: Displays the full path in the address bar
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v fullPathAddress /t REG_DWORD /d 1 /f
:: Disable Thumbnail Cache
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v DisableThumbnailCache /t REG_DWORD /d 1 /f
:: Launches folder dialogs in separate processes
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v separateProcess /t REG_DWORD /d 1 /f
:: Show hidden files in Explorer
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Hidden /t REG_DWORD /d 1 /f
:: Show file extensions in Explorer
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v HideFileExt /t REG_DWORD /d 0 /f
:: Show protected operating system files in Explorer
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v ShowSuperHidden /t REG_DWORD /d 1 /f
:: Show Administrative Tools in Start Menu
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v StartMenuAdminTools /t REG_DWORD /d 1 /f
:: Show Run command in Start Menu
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Start_ShowRun /t REG_DWORD /d 1 /f
:: Supress network location Prompt
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Network\ /v NewNetworkWindowOff /t REG_DWORD /d 1 /f
:: Disable Thumbnail Cache on network files
%SystemRoot%\System32\reg.exe ADD HKCU\Software\Policies\Microsoft\Explorer\ /v DisableThumbsDBOnNetworkFolders /t REG_DWORD /d 1 /f
