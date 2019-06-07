$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$packageVersion = '0.14.2'
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.17.0/AWS_SAM_CLI_32_PY3.msi'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.17.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum = '09fa5001c567fd056c4123ed19c554432ef3416e38f169f90bf2431743f2b797'
  Checksum64 = 'cf5d1059d9566ec22c20dbdfd4e8379e4c4e583603c87bd5c360fea130a9d964'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
