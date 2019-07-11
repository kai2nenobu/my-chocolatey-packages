$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$location    = $env:ChocolateyPackageFolder

$packageArgs = @{
  PackageName = $packageName
  FileType = 'msi'
  SilentArgs = '/quiet'
  Url = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.18.0/AWS_SAM_CLI_32_PY3.msi'
  Url64bit = 'https://github.com/awslabs/aws-sam-cli/releases/download/v0.18.0/AWS_SAM_CLI_64_PY3.msi'
  ChecksumType = 'sha256'
  Checksum = '5790c9f4c42dc27626acb98e41fca29cb641f3bd7a5c9d19e72f19b24c4579b7'
  Checksum64 = '2c645a978f6be4cba235ce7fe710b3ac5e1e41afafe81a4425b35c08976c65d5'
}


## Download the msi installer and install
Install-ChocolateyPackage @packageArgs
