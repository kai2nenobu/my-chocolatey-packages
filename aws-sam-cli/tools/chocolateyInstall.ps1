$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/aws/aws-sam-cli/releases/download/v1.34.1/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '4f4ee43fd0f8feeeae90d7b9173fb5bd8de276a9e2865ef0f8382841503672c8'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
