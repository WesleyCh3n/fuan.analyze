Write-Host @'
Downloading fuan analyze...
'@

$root_dir = "fuan.analyze"

if (Test-Path $root_dir) {
    Remove-Item $root_dir -Force -Recurse
}

$url = "https://github.com/WesleyCh3n/analyze.api/releases/download/latest/analyze.api-x86_64-pc-windows-msvc.zip"
Invoke-WebRequest -OutFile analyze_api.zip $url
Expand-Archive analyze_api.zip -DestinationPath ./$root_dir/

$url = "https://github.com/WesleyCh3n/analyze.rs/releases/download/latest/analyze.rs-x86_64-pc-windows-msvc.zip"
Invoke-WebRequest -OutFile analyze_rs.zip $url
Expand-Archive analyze_rs.zip -DestinationPath ./$root_dir/
New-Item -Path "./$root_dir/bin" -ItemType "directory" | Out-Null
Move-Item -Path "./$root_dir/analyze-rs.exe" -Destination "./$root_dir/bin/analyze-rs.exe"

$url = "https://github.com/WesleyCh3n/analyze.web/releases/download/latest/analyze.web-static.tar.gz"
Invoke-WebRequest -OutFile analyze_web.tar.gz $url
tar -xf analyze_web.tar.gz -C ./$root_dir/assets/

Remove-Item analyze*.zip
Remove-Item analyze*.tar.gz

Write-Host @'
Finished!
'@

Write-Host -ForegroundColor Green @'
Go to `fuan.analyze` folder and open analyze-api.exe.
Then, go to `localhost:3001` in the browsJer.
'@
