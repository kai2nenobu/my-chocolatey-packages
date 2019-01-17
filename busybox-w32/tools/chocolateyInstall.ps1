$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName    = $env:ChocolateyPackageName
$packageFolder  = $env:ChocolateyPackageFolder
$exePath        = Join-Path $packageFolder 'busybox.exe'
$serial         = '1946'
$commitHash     = '99daecdac'
$url            = "https://frippery.org/files/busybox/busybox-w32-FRP-${serial}-g${commitHash}.exe"
$checksum       = 'B728AF6280AA3502DF3458EAFD6BFCA33E2DD047B0D89B63A5F97154AAB09CA9'
$url64          = "https://frippery.org/files/busybox/busybox-w64-FRP-${serial}-g${commitHash}.exe"
$checksum64     = '6DB7BBC111584E18B2A6E328D6CCB7867F02D750ADA2355DECD072CCE34FFCD9'
$checksumType   = 'sha256'

## Download and unpack a zip file - https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Get-ChocolateyWebFile `
  -PackageName $packageName `
  -FileFullPath  $exePath `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType $checksumType `
  -Url64bit $url64 `
  -Checksum64 $checksum64 `
  -ChecksumType64 $checksumType
