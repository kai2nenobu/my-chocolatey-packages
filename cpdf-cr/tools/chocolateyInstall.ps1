$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder
$commit      = '8e308f25a329e6ac3728a69afdc1ef531a24767c'
$url         = 'https://github.com/coherentgraphics/cpdf-binaries/archive/{0}.zip' -f $commit
$checksum    = 'e5ad21334a40fa438e4f7629a5924cd5'

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -UnzipLocation $location

## Rename unzipped directory
$subDirectory = 'cpdf-binaries-{0}' -f $commit
Rename-Item -path "$(Join-Path $location $subDirectory)" -newName 'cpdf-binaries'
