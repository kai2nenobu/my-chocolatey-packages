$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.21.0/AWS_SAM_CLI_32_PY3.msi'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.21.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum = '70a3ab771a8d646413b38da14be5eafa5491917123fe4fc92c84a1338cb06887'
  Checksum64 = '4421cf7628c3b0eb70698b7d84dd6b660069def7508708d17234db0d67f16dbf'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
