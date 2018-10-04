$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url         = '{{Url}}'
$checksum    = '{{Checksum}}'
$url64       = '{{Url64}}'
$checksum64  = '{{Checksum64}}'
$checksumType = 'md5'

## Download and install pleaides in a tools directory (Typically "C:\tools")
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
$workdir = Split-Path $executable -Parent
$shortcut = Join-Path $CommonPrograms "$packageName/{{PackageTitle}}.lnk"
Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $executable `
  -WorkingDirectory $workdir
