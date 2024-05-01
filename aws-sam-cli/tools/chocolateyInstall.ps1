$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/aws/aws-sam-cli/releases/download/v1.116.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = 'bfd04ad44737c6e2e854ccf4a27c505d01cc3aee4a5e0d9d5fb0689fcdf3c8f5'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
