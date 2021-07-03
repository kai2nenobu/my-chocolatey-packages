$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$unzipLocation = Join-Path $env:ChocolateyPackageFolder 'a5m2'
$url = 'https://a5m2.mmatsubara.com/download/a5m2_2.15.5_x86.zip'
$checksum = '5b03f399c435de97185d2832b7c79415a7033acf906575bc61cc7fc7866ba8ce'
$url64 = 'https://a5m2.mmatsubara.com/download/a5m2_2.15.5_x64.zip'
$checksum64 = '3a288f53fcdf7dd9beafd76c6d73d69b0a4a2ff799e87b07f32cdd804d744c08'

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
  -ChecksumType 'sha256' `
  -UnzipLocation $unzipLocation

# Prevent from generating shim for a5m2.exe
New-Item (Join-Path $unzipLocation 'a5m2.exe.ignore') -type file -force | Out-Null

## Create a shortcut to a5m2.exe in Start Menu
Install-ChocolateyShortcut `
  -ShortcutFilePath (Join-Path $([Environment]::GetFolderPath('CommonStartMenu')) 'Programs\A5-SQL Mk-2 (a5m2).lnk') `
  -TargetPath (Join-Path $unzipLocation 'a5m2.exe')
