$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url64bit = 'https://github.com/aws/aws-sam-cli/releases/download/v1.61.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum64 = 'f5b2c7bc8041e9d14ca3c797f0fe4ce0d44f64d37b3cf9a4dcc10cf3f0d0185a'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
