$ErrorActionPreference = "Stop"

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

if ($env:ChocolateyForceX86 -Or !$env:OS_IS64BIT) {
  $exe = 'busybox.exe'
} else {
  $exe = 'busybox64.exe'
}

## Create a shim to busybox[64].exe
Install-BinFile `
  -Name busybox `
  -Path "${env:ChocolateyPackageFolder}\tools\${exe}"
