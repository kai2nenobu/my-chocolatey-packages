$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/aws/aws-sam-cli/releases/download/v1.56.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '1622a50e8b227663e3a81f89dd4b907ac6cf9d06890e369599a61cecb50f08a7'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
