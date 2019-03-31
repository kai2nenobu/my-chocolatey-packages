$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

if ($env:ChocolateyForceX86 -Or !$env:OS_IS64BIT) {
  $subDirectory = 'Release'
} else {
  $subDirectory = 'Release_x64'
}

## Create a shim to mozc_emacs_helper.exe
Install-BinFile `
  -Name mozc_emacs_helper `
  -Path "${env:ChocolateyPackageFolder}\${subDirectory}\mozc_emacs_helper.exe"
