$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$unzipLocation = Join-Path $env:ChocolateyPackageFolder 'a5m2'
$url = 'https://a5m2.mmatsubara.com/download/a5m2_2.14.1_x86.zip'
$checksum = 'a3dd4b30d9682f7b279508153d3f4a28c8e976f2f41eff88b9a1bc33ad00a4ad'
$url64 = 'https://a5m2.mmatsubara.com/download/a5m2_2.14.1_x64.zip'
$checksum64 = 'd3eab7097c950f0a555b1724e8812e9329dcc0c2cf0fa896e72b83c8ceea19e0'

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
