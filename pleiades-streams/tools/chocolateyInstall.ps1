﻿$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'pleiades-platform'
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url = 'https://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2023/pleiades-2023-09-platform-win-64bit_20231005.exe'
$checksum = '0efa80e656f8dfbc73e9344af94f3c44'
$checksumType = 'md5'
$shortcutName = 'Pleiades All in One Platform Standard Edition.lnk'

## Download and install pleaides in a tools directory (Typically "C:\tools")
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType $checksumType `
  -UnzipLocation $installPath

## Create a shortcut to eclipse.exe
$CommonPrograms = ([Environment]::GetFolderPath('CommonPrograms'))
$executable = Join-Path $installPath 'eclipse/eclipse.exe'
$workdir = Split-Path $executable -Parent
$shortcut = Join-Path $CommonPrograms "$packageName/$shortcutName"
Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $executable `
  -WorkingDirectory $workdir
