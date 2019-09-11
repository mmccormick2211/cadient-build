try { 
    "##### Disabling AutoLogon..."
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /d 0 /f 
}
catch { }

try { 
    "##### Disabling Update Services..."
    Stop-Service -Name wuauserv -Force
}
catch { }

try {
    "##### Cleaning SxS..."
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
}
catch { }

@(
    "$env:localappdata\Nuget",
    "$env:localappdata\temp\*",
    "$env:windir\logs",
    "$env:windir\panther",
    "$env:windir\temp\*",
    "$env:windir\winsxs\manifestcache",
    "$env:windir\SoftwareDistribution\Download\*"
) | ForEach-Object {
    if (Test-Path $_) {
        "##### Removing $_"
        try {
            Takeown /d Y /R /f $_
            Icacls $_ /GRANT:r administrators:F /T /c /q  2>&1 | Out-Null
            Remove-Item $_ -Recurse -Force | Out-Null
        }
        catch { $global:error.RemoveAt(0) }
    }

}

try { 
    "##### Clearing Event Logs..."
    Clear-EventLog -LogName (GEt-EventLog -List).log 
}
catch { }

try {
    "##### Running UltraDefrag..."
    Start-Process -FilePath "C:\Program Files\UltraDefrag\udefrag.exe" -ArgumentList '--optimize', '--repeat C:' -Wait
}
catch { }

try {
    "##### Running SDelete..."
    Start-Process -FilePath 'reg.exe' -ArgumentList 'ADD HKCU\Software\Sysinternals\SDelete', '/v EulaAccepted', '/t REG_DWORD', '/d 1', '/f' -Wait
    Start-Process -FilePath 'sdelete.exe' -ArgumentList '-q', '-z', 'C:' -Wait
}
catch { }

"##### Restarting Update Services..."
Start-Service -Name wuauserv
try {
    "##### Removing UltraDefrag..."
    Start-Process -FilePath "choco.exe" -ArgumentList 'uninstall', 'ultradefrag', '--yes' -Wait
}
catch { }
