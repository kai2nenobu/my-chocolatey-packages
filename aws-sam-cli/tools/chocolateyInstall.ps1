$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.19.0/AWS_SAM_CLI_32_PY3.msi'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.19.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum = 'e2557cd9c0cfe1c24b46ed4ae2a04c945c2f7fec18b5517f207a21c593942ba5'
  Checksum64 = 'df716bd6b0748a56458f4828acb39ade6fc351e7a573bb801e5a25e5784cafa9'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
