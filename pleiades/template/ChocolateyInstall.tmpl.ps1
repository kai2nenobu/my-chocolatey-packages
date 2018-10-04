$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$installPath = Join-Path (Get-ToolsLocation) $packageName
$url         = '{{Url}}'
$checksum    = '{{Checksum}}'
$url64       = '{{Url64}}'
$checksum64  = '{{Checksum64}}'
$checksumType = 'md5'
$subFolder   = 'pleiades'

## Download and install netupvim in a tools directory (Typically "C:\tools")
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType $checkstumType `
  -Url64bit $url64 `
  -Checksum64 $checksum64 `
  -ChecksumType64 $checkstumType `
  -UnzipLocation $installPath `
  -SpecificFolder $subFolder
