$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder
$url         = 'https://github.com/ipponshimeji/MAPE/raw/master/Releases/MAPE_1.0.19.0_Windows.zip'
$checksum    = '1959AA0E4427EAEFB04E5B533766F911'

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -UnzipLocation $location
