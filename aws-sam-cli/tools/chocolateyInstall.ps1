$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.38.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '78fc52d53dda5fec58c207fa715dbf4eceb7b5f0cb3d5747fa450f50f5c008bd'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
