@echo off
choco pin remove --yes --acceptlicense --nocolor --name=powershell
::choco pin add --yes --acceptlicense --nocolor --name=powershell --version=3.0.20121027
::choco pin add --yes --acceptlicense --nocolor --name=powershell --version=4.0.20141001
::choco pin add --yes --acceptlicense --nocolor --name=powershell --version=5.0.10586.20170115
::choco pin add --yes --acceptlicense --nocolor --name=powershell --version=5.1.14409.20180811
choco install powershell --yes --acceptlicense --nocolor 