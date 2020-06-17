$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.53.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '88f92922f1ebab84316e6dc42b7fba620c0c464bbefb925b0e1cb38b5481002e'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
