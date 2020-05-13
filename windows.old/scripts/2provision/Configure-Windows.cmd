@ECHO OFF
ECHO.Configuring PowerShell Execution Policies...
ECHO.-- Set Powershell Execution Policy to "RemoteSigned" - OS Architecture Native
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"
ECHO.-- Set Powershell Execution Policy - WOW64
%SystemRoot%\SysWOW64\cmd.exe /c %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"

ECHO.Clearing pre-logon Legal Notice...
%SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon"   /v LegalNoticeCaption /t REG_SZ /d "" /f
%SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon"   /v LegalNoticeText    /t REG_SZ /d "" /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LegalNoticeCaption /t REG_SZ /d "" /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LegalNoticeText    /t REG_SZ /d "" /f

ECHO.Configuring Explorer settings...
ECHO.-- Show all icons and notifications on the taskbar notification area
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v EnableAutoTray /t REG_DWORD /d 0 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v EnableAutoTray /t REG_DWORD /d 0 /f
ECHO.-- Displays the full path in the address bar
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v fullPathAddress /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v fullPathAddress /t REG_DWORD /d 1 /f
ECHO.-- Disable Thumbnail Cache
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v DisableThumbnailCache /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v DisableThumbnailCache /t REG_DWORD /d 1 /f
ECHO.-- Launches folder dialogs in separate processes
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v separateProcess /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v separateProcess /t REG_DWORD /d 1 /f
ECHO.-- Show hidden files in Explorer
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 1 /f
ECHO.-- Show file extensions in Explorer
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f
ECHO.-- Show protected operating system files in Explorer
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowSuperHidden /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowSuperHidden /t REG_DWORD /d 1 /f
ECHO.-- Show Administrative Tools in Start Menu
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v StartMenuAdminTools /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v StartMenuAdminTools /t REG_DWORD /d 1 /f
ECHO.-- Show Run command in Start Menu
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Start_ShowRun /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Start_ShowRun /t REG_DWORD /d 1 /f
ECHO.-- Supress network location Prompt
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Network /v NewNetworkWindowOff /f
ECHO.-- Disable Thumbnail Cache on network files
%SystemRoot%\System32\reg.exe ADD HKCU\Software\Policies\Microsoft\Explorer /v DisableThumbsDBOnNetworkFolders /t REG_DWORD /d 1 /f
%SystemRoot%\System32\reg.exe ADD HKLM\Software\Policies\Microsoft\Explorer /v DisableThumbsDBOnNetworkFolders /t REG_DWORD /d 1 /f
ECHO.-- Enable Powershell on Win+X Menu
%SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V DontUsePowerShellOnWinX /T REG_DWORD /D 0 /F
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V DontUsePowerShellOnWinX /T REG_DWORD /D 0 /F
: ECHO.-- Enable Command Prompt on Win+X Menu
: %SystemRoot%\System32\reg.exe ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V DontUsePowerShellOnWinX /T REG_DWORD /D 1 /F
: %SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V DontUsePowerShellOnWinX /T REG_DWORD /D 1 /F
ECHO.-- Enable Console QuickEdit mode
%SystemRoot%\System32\reg.exe ADD HKCU\Console /v QuickEdit /t REG_DWORD /d 1 /f

ECHO.Configuring Accessabilty Options and misc. services...
ECHO.-- Disable Windows 10 Compatibility Appraiser Scheduled Task
schtasks /End    /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
ECHO.-- Disable Windows Ink Workspace
%SystemRoot%\System32\reg.exe ADD HKCU\Software\Policies\Microsoft\WindowsInkWorkspace /v AllowWindowsInkWorkspace /t REG_DWORD /d 0 /f
%SystemRoot%\System32\reg.exe ADD HKLM\Software\Policies\Microsoft\WindowsInkWorkspace /v AllowWindowsInkWorkspace /t REG_DWORD /d 0 /f
ECHO.-- Disable Windows Touch Keyboard
%SystemRoot%\System32\reg.exe ADD "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /v TipbandDesiredVisibility /t REG_DWORD /d 0 /f
%SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\TabletTip\1.7" /v TipbandDesiredVisibility /t REG_DWORD /d 0 /f
ECHO.-- Disable Touch Keyboard and Handwriting Panel Service
%SystemRoot%\System32\sc.exe config TabletInputService start= disabled
ECHO.-- Disable Windows Search Service
%SystemRoot%\System32\sc.exe config WSearch start= disabled

ECHO.Configuring Power Settings...
ECHO.-- Set power configuration to High Performance
%SystemRoot%\System32\powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
ECHO.-- Don't blank monitor on AC
%SystemRoot%\System32\powercfg.exe -Change -monitor-timeout-ac 0
ECHO.-- Don't blank monitor on DC
%SystemRoot%\System32\powercfg.exe -Change -monitor-timeout-dc 0
ECHO.-- Disable ScreenSaver
%SystemRoot%\System32\reg.exe ADD "HKLM\Control Panel\Desktop" /v ScreenSaveActive /t REG_DWORD /d 0 /f
ECHO.-- Zero Hibernation File
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power /v HibernateFileSizePercent /t REG_DWORD /d 0 /f
ECHO.-- Disable Hibernation Mode
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power /v HibernateEnabled /t REG_DWORD /d 0 /f

ECHO.Configuring Security options...
ECHO.- Configuring Internet Explorer Enhanced Security Configuration (IE ESC)...
ECHO.-- Enable for Administrators
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073} /v IsInstalled /t REG_DWORD /d 1 /f
: ECHO.-- Disable for Administrators
: %SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073} /v IsInstalled /t REG_DWORD /d 0 /f
ECHO.-- Enable for Users
%SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073} /v IsInstalled /t REG_DWORD /d 1 /f
: ECHO.-- Disable for Users
: %SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073} /v IsInstalled /t REG_DWORD /d 0 /f
ECHO.- Configuring UAC...
: ECHO.-- Enable UAC
: %SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
: ECHO.-- Disable UAC
: %SystemRoot%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
ECHO.- Configuring Automatic Administrator Logon...
: ECHO.-- Disable AutoAdmin Logon
: %SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /d 0 /f
: ECHO.-- Enable AutoAdmin Logon
: %SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /d 1 /f
ECHO.- Disable AD computer account password change
%SystemRoot%\System32\reg.exe ADD HKLM\System\CurrentControlSet\Services\Netlogon\Parameters /v DisablePasswordChange /t REG_DWORD /d 1 /f

ECHO.Configuring Windows Updates...
: ECHO.-- Enable Windows Updates Full Automatic
: %SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 0 /f
ECHO.-- Enable Windows Updates Full Manual
%SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f
ECHO.-- Enable Windows Updates Notify Only
%SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 2 /f
ECHO.-- Enable Windows Updates Download Only
%SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 3 /f
: ECHO.-- Disable Windows Updates Recommended Updates
: %SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v IncludeRecommendedUpdates /t REG_DWORD /d 0 /f
ECHO.-- Enable Windows Updates Recommended Updates
%SystemRoot%\System32\reg.exe ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v IncludeRecommendedUpdates /t REG_DWORD /d 1 /f

ECHO.-- Configuring WinRM....
net stop winrm
%SystemRoot%\System32\sc.exe config winrm start= auto
net start winrm

CALL winrm quickconfig -quiet
CALL winrm quickconfig -transport:http
CALL winrm set winrm/config @{MaxTimeoutms="1800000"}
CALL winrm set winrm/config/winrs @{MaxMemoryPerShellMB="800"}
CALL winrm set winrm/config/service @{AllowUnencrypted="true"}
CALL winrm set winrm/config/service/auth @{Basic="true"}
CALL winrm set winrm/config/client/auth @{Basic="true"}
CALL winrm set winrm/config/listener?Address=*+Transport=HTTP @{Port="5985"}

%SystemRoot%\System32\netsh.exe advfirewall firewall set rule group="Windows Remote Management" new enable=yes
%SystemRoot%\System32\netsh.exe advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" new enable=yes action=allow

net stop winrm
%SystemRoot%\System32\sc.exe config winrm start= auto
net start winrm

EXIT /b
