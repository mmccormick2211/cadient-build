$file = "C:\users\vagrant\Desktop\delete-to-continue.txt";if (-Not (Test-Path $file)) {"Remove me"|Out-File $file};"Wait until someone removes $file";while (Test-Path $file) {Start-Sleep -Seconds 10};"Done waiting!"
