$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'pleiades-platform'
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url = 'https://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2021/pleiades-2021-12-platform-win-64bit_20220106.zip'
$checksum = 'd344de51faa560fee07ce97ddc78284e'
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
$executable = Join-Path $installPath 'eclipse/eclipse.exe'
$workdir = Split-Path $executable -Parent
$shortcut = Join-Path $CommonPrograms "$packageName/$shortcutName"
Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $executable `
  -WorkingDirectory $workdir
