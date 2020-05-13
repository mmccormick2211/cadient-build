## install vagrant public keyfile

try {
    if (Test-Path -Path 'A:\vagrant.pub') {   ## Packer Floppy
        if (Test-Path -Path "$env:USERPROFILE\.ssh" -PathType Leaf ) {
            Copy-Item -Path 'A:\vagrant.pub' -Destination "$env:USERPROFILE\.ssh\authorized_keys" -Force -PassThru
        }        
    }
}
catch { }

Get-Content -Path 'A:\vagrant.pub'


if exist a:\vagrant.pub (
    copy a:\vagrant.pub C:\Users\vagrant\.ssh\authorized_keys
) else (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub', 'C:\Users\vagrant\.ssh\authorized_keys')"
)
