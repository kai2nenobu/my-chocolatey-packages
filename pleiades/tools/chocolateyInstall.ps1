$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url         = 'http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-32bit-jre_20180925.zip'
$checksum    = '1e6fc190144175a2c49c294ea475ba45'
$url64       = 'http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-64bit-jre_20180925.zip'
$checksum64  = '7963c089d1cd76372e2f33500df6f3ee'
$checksumType = 'md5'

## Download and install netupvim in a tools directory (Typically "C:\tools")
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType $checkstumType `
  -Url64bit $url64 `
  -Checksum64 $checksum64 `
  -ChecksumType64 $checkstumType `
  -UnzipLocation $installPath

## Create a shortcut to eclipse.exe
$CommonPrograms =([Environment]::GetFolderPath('CommonPrograms'))
$executable = Join-Path $installPath 'pleiades/eclipse/eclipse.exe'
$shortcut = Join-Path $CommonPrograms "$packageName/Pleiades All in One Java.lnk"
Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $executable
