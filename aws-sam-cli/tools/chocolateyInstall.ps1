$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/aws/aws-sam-cli/releases/download/v1.2.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = 'bfb7973fb3fd9d475f1019b3c98ea29f083b7c5c8d9e10f1f7501f88d5d977b0'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
