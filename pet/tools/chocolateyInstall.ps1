$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

ls $toolsPath\* | ? { $_.PSISContainer } | rm -Recurse -Force #remove older package dirs

# Expand .tar.gz
$packageArgs = @{
    PackageName    = 'pet'
    FileFullPath   = Get-Item "$toolsPath\*_windows_386.tar.gz"
    FileFullPath64 = Get-Item "$toolsPath\*_windows_amd64.tar.gz"
    Destination    = $toolsPath
}
Get-ChocolateyUnzip @packageArgs

# Expand .tar
$packageArgs.FileFullPath = $packageArgs.FileFullPath -replace '\.gz$',''
$packageArgs.FileFullPath64 = $packageArgs.FileFullPath64 -replace '\.gz$',''
Get-ChocolateyUnzip @packageArgs

rm $toolsPath\*.tar.gz -ea 0
rm $toolsPath\*.tar -ea 0
