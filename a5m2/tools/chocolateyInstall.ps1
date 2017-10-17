$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$unzipLocation = Join-Path $env:ChocolateyPackageFolder 'a5m2'
$url         = 'http://a5m2.mmatsubara.com/download/a5m2_2.12.2_x86.zip'
$checksum    = '5b57d689b09c862e45c0a5ccd566074e'
$url64       = 'http://a5m2.mmatsubara.com/download/a5m2_2.12.2_x64.zip'
$checksum64  = '75522e39cad228d873232959efd461ff'

# if ($env:ChocolateyForceX86 -Or !$env:OS_IS64BIT) {
#   $subDirectory = 'cmigemo-default-win32'
# } else {
#   $subDirectory = 'cmigemo-default-win64'
# }

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -Url64bit $url64 `
  -Checksum64 $checksum64 `
  -UnzipLocation $unzipLocation

# Prevent from generating shim for a5m2.exe
New-Item (Join-Path $unzipLocation 'a5m2.exe.ignore') -type file -force | Out-Null

## Create a shortcut to a5m2.exe in Start Menu
Install-ChocolateyShortcut `
  -ShortcutFilePath (Join-Path $([Environment]::GetFolderPath('CommonStartMenu')) 'Programs\A5-SQL Mk-2 (a5m2).lnk') `
  -TargetPath (Join-Path $unzipLocation 'a5m2.exe')
