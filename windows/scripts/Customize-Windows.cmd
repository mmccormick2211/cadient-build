:: Set Powershell Execution Policy - 64 Bit
%ComSpec% /c powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"
:: Set Powershell Execution Policy - 32 Bit
%SystemRoot%\SysWOW64\cmd.exe /c powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"

:: Disable computer password change
%SystemRoot%\System32\reg.exe ADD HKLM\System\CurrentControlSet\Services\Netlogon\Parameters /v DisablePasswordChange /t REG_DWORD /d 1 /f


:: Enable Console QuickEdit mode
%SystemRoot%\System32\reg.exe ADD HKCU\Console /v QuickEdit /t REG_DWORD /d 1 /f
:: Show all icons and notifications on the taskbar notification area
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
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Network\ /v NewNetworkWindowOff
:: Disable Thumbnail Cache on network files
%SystemRoot%\System32\reg.exe ADD HKCU\Software\Policies\Microsoft\Explorer\ /v DisableThumbsDBOnNetworkFolders /t REG_DWORD /d 1 /f

:: Set power configuration to High Performance
%SystemRoot%\System32\powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
:: Don't blank monitor on AC
%SystemRoot%\System32\powercfg.exe -Change -monitor-timeout-ac 0
:: Don't blank monitor on DC
%SystemRoot%\System32\powercfg.exe -Change -monitor-timeout-dc 0
:: Disable ScreenSaver
%SystemRoot%\System32\reg.exe ADD 'HKCU:\Control Panel\Desktop' /v ScreenSaveActive /t REG_DWORD /d 0 /f
:: Zero Hibernation File
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateFileSizePercent /t REG_DWORD /d 0 /f
:: Disable Hibernation Mode
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateEnabled /t REG_DWORD /d 0 /f

