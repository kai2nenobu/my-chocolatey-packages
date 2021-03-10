$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'wsl-ssh-agent'
  FileFullPath64 = "$toolsPath\wsl-gpg-agent.zip"
  Destination    = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.zip -ea 0
