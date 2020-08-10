$ErrorActionPreference = 'Stop'; # stop on all errors

## Include common configurations
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$scriptDirectory\common.ps1"

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder
$url = 'https://github.com/ipponshimeji/MAPE/raw/master/Releases/MAPE_1.0.21.0_Windows.zip'
$checksum = '87c253040a7d415660e3c804827e9048f628f5639d9648352cc6fa2512c099d8'

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
