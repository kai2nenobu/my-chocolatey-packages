$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'ssh-agent-wsl'
  FileFullPath64 = "$toolsPath\ssh-agent-wsl.7z"
  Destination    = Join-Path $env:ChocolateyInstall 'bin'
}

Get-ChocolateyUnzip @packageArgs
rm $toolsPath\*.7z -ea 0
