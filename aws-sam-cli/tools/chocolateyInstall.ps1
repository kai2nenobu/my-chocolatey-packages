$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.48.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '7a8eb9c3de41b459dd7383734a85f1031d6c7563f0a935db854667ac9e89749d'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
