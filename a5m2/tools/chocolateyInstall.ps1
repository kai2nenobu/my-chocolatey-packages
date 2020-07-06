$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$unzipLocation = Join-Path $env:ChocolateyPackageFolder 'a5m2'
$url = 'https://a5m2.mmatsubara.com/download/a5m2_2.15.0_x86.zip'
$checksum = 'fe88e3e79413b1ef532022eac9cfa376b6e052d8ae727cb6615576972a303e97'
$url64 = 'https://a5m2.mmatsubara.com/download/a5m2_2.15.0_x64.zip'
$checksum64 = 'f3bc38359649b4b3d4d36d35db508f5843e6d203131a4d9b876dc1f7f4c0e332'

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
