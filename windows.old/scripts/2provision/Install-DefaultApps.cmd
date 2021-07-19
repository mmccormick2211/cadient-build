@echo off
echo.################ Base Applications Installation ###############
choco upgrade chocolatey --acceptlicense --yes
choco upgrade chocolatey-core.extension --acceptlicense --yes
:: choco upgrade chocolatey-dotnetfx.extension --acceptlicense --yes
:: choco upgrade chocolatey-windowsupdate.extension --acceptlicense --yes

::choco upgrade vcredist-all --acceptlicense --yes

:: choco upgrade ultradefrag  --acceptlicense --yes
:: choco upgrade splunk-universalforwarder --acceptlicense --yes --params="RECEIVING_INDEXER=sys-splunk-app1.corp.unicru.com:9997 DEPLOYMENT_SERVER=sys-splunk-app1.corp.unicru.com:8089"
choco upgrade 7zip.install --acceptlicense --yes
choco upgrade sysinternals --acceptlicense --yes
choco upgrade vmware-tools --acceptlicense --yes
choco upgrade all --acceptlicense --yes
EXIT /B


