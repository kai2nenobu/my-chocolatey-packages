$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/aws/aws-sam-cli/releases/download/v1.17.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = 'b889527e36f168134cd14090998bf25b07003bca534837f0838c7c7d515321ee'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
