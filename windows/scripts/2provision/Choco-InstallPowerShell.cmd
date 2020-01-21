@echo off
echo.############### WMF/PowerShell Installation ###############
:: choco install powershell --version=3.0.20121027       --acceptlicense --yes
:: choco install powershell --version=4.0.20141001       --acceptlicense --yes
:: choco install powershell --version=5.0.10586.20170115 --acceptlicense --yes
:: choco install powershell --version=5.1.14409.20180811 --acceptlicense --yes
choco install powershell --acceptlicense --yes
choco pin remove --name=powershell
choco pin add    --name=powershell