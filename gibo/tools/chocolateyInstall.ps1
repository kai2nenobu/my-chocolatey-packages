$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

ls $toolsPath\* | ? { $_.PSISContainer } | rm -Recurse -Force #remove older package dirs

# Expand .zip
$packageArgs = @{
    PackageName    = 'gibo'
    FileFullPath   = Get-Item "$toolsPath\gibo-*.zip"
    Destination    = $toolsPath
}
Get-ChocolateyUnzip @packageArgs

# Remove .zip
rm $toolsPath\*.zip -ea 0

# Create a shim to gibo.bat
$bat = @(Get-ChildItem -LiteralPath $toolsPath -Filter gibo.bat -Recurse -Force)
if ($bat.Count -eq 0) {
  throw "gibo.bat not found in $toolsPath. Something wrong."
}
Install-BinFile -Name 'gibo' -Path $bat[0].FullName

# Copy a shell script to run in unix shell like Git Bash, MSYS2
$sh = @(Get-ChildItem -LiteralPath $toolsPath -Filter gibo -Recurse -Force)
if ($sh.Count -eq 0) {
  throw "gibo not found in $toolsPath. Something wrong."
}
Copy-Item -LiteralPath $sh[0].FullName -Destination (Join-Path $env:ChocolateyInstall 'bin')
