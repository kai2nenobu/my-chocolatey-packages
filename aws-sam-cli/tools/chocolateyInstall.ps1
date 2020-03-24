$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.46.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '1a4d7e0d0d4484c282ce0c62c432b9b28d0389cc6b329834e0ecab73a6e37452'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
