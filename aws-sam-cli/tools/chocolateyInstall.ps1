$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/aws/aws-sam-cli/releases/download/v1.108.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = '84b7b53cbe28a3f5758a5373046260a4bf2359d23a1cd37b83b1608036d79317'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
