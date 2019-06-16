$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$is64      = (Get-ProcessorBits 64) -and $env:chocolateyForceX86 -ne 'true'

$packageArgs = @{
    PackageName    = 'ghq'
    FileFullPath   = Get-Item "$toolsPath\*_windows_386.zip"
    FileFullPath64 = Get-Item "$toolsPath\*_windows_amd64.zip"
    Destination    = $toolsPath
}

ls $toolsPath\* | ? { $_.PSISContainer } | rm -Recurse -Force #remove older package dirs
Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.zip -ea 0
