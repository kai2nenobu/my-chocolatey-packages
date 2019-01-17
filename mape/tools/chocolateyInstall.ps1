$ErrorActionPreference = 'Stop'; # stop on all errors

## Include common configurations
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$scriptDirectory\common.ps1"

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder
$url         = 'https://github.com/ipponshimeji/MAPE/raw/master/Releases/MAPE_1.0.20.0_Windows.zip'
$checksum    = 'C7B01E06FA5A115E15704829B502F184'

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -UnzipLocation $location

## Create a shortcut for GUI program in Common Programs Location
$gui = Join-Path $location 'MAPE\mapegui.exe'
$icon = Join-Path $location 'MAPE\Resources\OnIcon.ico'

Install-ChocolateyShortcut `
  -ShortcutFilePath $guiShortcut `
  -TargetPath $gui `
  -IconLocation $icon
