$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder
$url         = 'http://files.kaoriya.net/goto/cmigemo_w32'
$checksum    = '82c45c460b8a5ea531580dc44e43ccd3'
$url64       = 'http://files.kaoriya.net/goto/cmigemo_w64'
$checksum64  = '7eab24b6222ece81423bdb25927e17ba'

if ($env:ChocolateyForceX86 -Or !$env:OS_IS64BIT) {
  $subDirectory = 'cmigemo-default-win32'
} else {
  $subDirectory = 'cmigemo-default-win64'
}

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -Url64bit $url64 `
  -Checksum64 $checksum64 `
  -UnzipLocation $location

## Rename unzipped directory into "bin"
Rename-Item -path "$(Join-Path $location $subDirectory)" -newName bin
