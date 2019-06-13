$ErrorActionPreference = 'Stop'; # stop on all errors

## Include common configurations
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$scriptDirectory\common.ps1"

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder
$url         = 'https://github.com/ipponshimeji/MAPE/raw/master/Releases/MAPE_1.0.21.0_Windows.zip'
$checksum    = '8BA7EBD25634D554DE376F5C9B91E78A'

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType 'sha256' `
  -UnzipLocation $location

## Create a shortcut for GUI program in Common Programs Location
$gui = Join-Path $location 'MAPE\mapegui.exe'
$icon = Join-Path $location 'MAPE\Resources\OnIcon.ico'

Install-ChocolateyShortcut `
  -ShortcutFilePath $guiShortcut `
  -TargetPath $gui `
  -IconLocation $icon
