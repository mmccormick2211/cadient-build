@echo off
echo.############### .NET Framework Installation ###############
choco install dotnet3.5                  --acceptlicense --yes
:: choco install dotnetfx --version=4.5.0.0 --acceptlicense --yes
:: choco install dotnetfx --version=4.5.1.0 --acceptlicense --yes
choco install dotnetfx --version=4.5.2.0 --acceptlicense --yes
:: choco install dotnetfx --version=4.6.0.0 --acceptlicense --yes
:: choco install dotnetfx --version=4.6.1.0 --acceptlicense --yes
:: choco install dotnetfx --version=4.6.2.0 --acceptlicense --yes
:: choco install dotnetfx --version=4.7.0.0 --acceptlicense --yes
:: choco install dotnetfx --version=4.7.1.0 --acceptlicense --yes
:: choco install dotnetfx --version=4.7.2.0 --acceptlicense --yes
:: choco install dotnetfx                   --acceptlicense --yes
choco pin remove --name=dotnetfx --acceptlicense --yes
choco pin add    --name=dotnetfx --acceptlicense --yes
