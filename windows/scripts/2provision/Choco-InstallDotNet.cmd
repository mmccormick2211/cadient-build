@echo off
choco upgrade dotnet3.5 --yes --acceptlicense --nocolor 
choco install dotnetfx --yes --acceptlicense --nocolor --version=4.5.2.0
choco pin remove --yes --acceptlicense --nocolor --name=dotnetfx
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.5.0.0
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.5.1.0
choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.5.2.0
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.6.0.0
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.6.1.0
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.6.2.0
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.7.0.0
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.7.1.0
::choco pin add --yes --acceptlicense --nocolor --name=dotnetfx --version=4.7.2.0
