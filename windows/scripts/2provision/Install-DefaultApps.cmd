@echo off
echo.################ Base Applications Installation ###############
choco upgrade chocolatey --acceptlicense --yes
choco upgrade chocolatey-core.extension --acceptlicense --yes
choco upgrade chocolatey-dotnetfx.extension --acceptlicense --yes
choco upgrade chocolatey-windowsupdate.extension --acceptlicense --yes

choco upgrade vcredist-all --acceptlicense --yes

choco upgrade 7zip.install --acceptlicense --yes
choco upgrade sysinternals --acceptlicense --yes
choco upgrade ultradefrag  --acceptlicense --yes
:: choco upgrade vmware-tools --acceptlicense --yes
EXIT /B
