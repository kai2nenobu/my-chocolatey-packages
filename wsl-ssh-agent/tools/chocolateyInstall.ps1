$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'wsl-ssh-agent'
  FileFullPath64 = "$toolsPath\wsl-ssh-agent.7z"
  Destination    = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.7z -ea 0
