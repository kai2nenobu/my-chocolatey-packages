﻿$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'pleiades-platform'
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url = 'https://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2021/pleiades-2021-03-platform-win-64bit_20210328.zip'
$checksum = '467c3c49180a827cf20114b9915a20cf'
$checksumType = 'md5'
$shortcutName = 'Pleiades All in One Platform Standard Edition.lnk'

## Download and install pleaides in a tools directory (Typically "C:\tools")
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType $checkstumType `
  -UnzipLocation $installPath

## Create a shortcut to eclipse.exe
$CommonPrograms =([Environment]::GetFolderPath('CommonPrograms'))
$executable = Join-Path $installPath 'pleiades/eclipse/eclipse.exe'
$workdir = Split-Path $executable -Parent
$shortcut = Join-Path $CommonPrograms "$packageName/$shortcutName"
Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $executable `
  -WorkingDirectory $workdir
