@echo off
setlocal

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

shutdown /r /t 10 /f /d p:4:1 /c "Packer Reboot"