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

## Create a shortcut for GUI program in Common Programs Location
$gui = Join-Path $location 'MAPE\mapegui.exe'
$icon = Join-Path $location 'MAPE\Resources\OnIcon.ico'
$commonPrograms = [Environment]::GetFolderPath('CommonPrograms')
$shortcutPath = Join-Path $commonPrograms '認証プロキシ爆発しろ！ (MAPE).lnk'

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcutPath `
  -TargetPath $gui `
  -IconLocation $icon
