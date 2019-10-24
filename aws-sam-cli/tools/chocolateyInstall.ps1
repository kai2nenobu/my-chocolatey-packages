$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.23.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '41bb568f05f2f8f53244a3517e497d8fb70a0e7e0d750cad62a408197c4dfefc'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
