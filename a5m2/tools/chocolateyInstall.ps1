$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$unzipLocation = Join-Path $env:ChocolateyPackageFolder 'a5m2'
$url = 'https://a5m2.mmatsubara.com/download/a5m2_2.14.4_x86.zip'
$checksum = '292eed28ef039de2485618c87514c4e44dec45fa3a962f449a5e19a8ee4892a5'
$url64 = 'https://a5m2.mmatsubara.com/download/a5m2_2.14.4_x64.zip'
$checksum64 = '784660dd41afd16760e2e5b4f69d71e9a57a694bf9ac467e9387117679226eaf'

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
