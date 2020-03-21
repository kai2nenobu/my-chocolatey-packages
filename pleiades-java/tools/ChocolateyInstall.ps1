$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url = 'http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2020/pleiades-2020-03-java-win-64bit_20200322.zip'
$checksum = '8365d6a765157f18002b87ba8c5c2273'
$checksumType = 'md5'

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
$shortcut = Join-Path $CommonPrograms "$packageName/Pleiades All in One Java.lnk"
Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $executable `
  -WorkingDirectory $workdir
