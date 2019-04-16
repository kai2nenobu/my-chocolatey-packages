$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$packageVersion = '0.14.2'
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url = "https://github.com/awslabs/aws-sam-cli/releases/download/v${packageVersion}/AWS_SAM_CLI_32_PY3.msi"
  Url64bit = "https://github.com/awslabs/aws-sam-cli/releases/download/v${packageVersion}/AWS_SAM_CLI_64_PY3.msi"
  ChecksumType = 'sha256'
  Checksum = '21BAC6DD756DA1327ED2A8894CED604C50A88B88DEB80EBD950778ADD257258C'
  Checksum64 = 'CF3E02E21D496B7BBBFB4BCE0FBC3AC99BE2C5FE53DCCEE8809BF2321B84B372'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
