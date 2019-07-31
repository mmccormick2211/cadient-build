Write-Host "Disabling AutoLogon..."
try {
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /d 0 /f
}
catch { }

Write-Host "Cleaning SxS..."
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

@(
    "$env:localappdata\Nuget",
    "$env:localappdata\temp\*",
    "$env:windir\logs",
    "$env:windir\panther",
    "$env:windir\temp\*",
    "$env:windir\winsxs\manifestcache",
    "$env:windir\SoftwareDistribution\Download\*"
) | % {
        if(Test-Path $_) {
            Write-Host "Removing $_"
            try {
              Takeown /d Y /R /f $_
              Icacls $_ /GRANT:r administrators:F /T /c /q  2>&1 | Out-Null
              Remove-Item $_ -Recurse -Force | Out-Null
            } catch { $global:error.RemoveAt(0) }
        }

Get-Service -Name wuauserv | Start-Service -Force -Verbose -NoWait -Confirm $false

Write-Host "Running UltraDefrag..."
try {
    udefrag.exe --optimize --repeat C:
}
catch { }

Write-Host "Running SDelete..."
try {
    reg.exe ADD HKCU\Software\Sysinternals\SDelete /v EulaAccepted /t REG_DWORD /d 1 /f
    sdelete.exe -q -z C:
}
catch { }
