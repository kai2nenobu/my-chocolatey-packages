$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url         = 'https://github.com/koron/netupvim/releases/download/v1.4.1/netupvim-v1.4.1.zip'
$checksum    = 'C7999D4F29A0883CF4327DF9131AA57A'
$checksumType = 'md5'

## Download and install netupvim in a tools directory (Typically "C:\tools")
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType $checkstumType `
  -UnzipLocation $installPath

## Create a shortcut for updater
$CommonPrograms =([Environment]::GetFolderPath('CommonPrograms'))
$updater = Join-Path $installPath 'UPDATE.bat'
$updaterShortcut = Join-Path $CommonPrograms "$packageName/Update Vim ($packageName).lnk"
Install-ChocolateyShortcut `
  -ShortcutFilePath $updaterShortcut `
  -TargetPath $updater

## Create a shortcut for restorer
$restorer = Join-Path $installPath 'RESTORE.bat'
$restorerShortcut = Join-Path $CommonPrograms "$packageName/Restore Vim ($packageName).lnk"
Install-ChocolateyShortcut `
  -ShortcutFilePath $restorerShortcut `
  -TargetPath $restorer
