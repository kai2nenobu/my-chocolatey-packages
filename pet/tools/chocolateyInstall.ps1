$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName    = 'pet'
    FileFullPath   = Get-Item "$toolsPath\*_windows_386.tar.gz"
    FileFullPath64 = Get-Item "$toolsPath\*_windows_amd64.tar.gz"
    Destination    = $toolsPath
}

ls $toolsPath\* | ? { $_.PSISContainer } | rm -Recurse -Force #remove older package dirs
Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.tar.gz -ea 0
