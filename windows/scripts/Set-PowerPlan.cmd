:: Set power configuration to High Performance
%SystemRoot%\System32\powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
:: Don't blank monitor on AC
%SystemRoot%\System32\powercfg.exe -Change -monitor-timeout-ac 0
:: Don't blank monitor on DC
%SystemRoot%\System32\powercfg.exe -Change -monitor-timeout-dc 0
:: Disable ScreenSaver
%SystemRoot%\System32\reg.exe ADD 'HKCU\Control Panel\Desktop' /v ScreenSaveActive /t REG_DWORD /d 0 /f
:: Zero Hibernation File
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateFileSizePercent /t REG_DWORD /d 0 /f
:: Disable Hibernation Mode
%SystemRoot%\System32\reg.exe ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateEnabled /t REG_DWORD /d 0 /f
