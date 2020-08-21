$ErrorActionPreference = 'Stop'

## Include common configurations
$toolsDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. (Join-Path $toolsDir 'common.ps1')

$hackgenVersion = 'v2.1.1'
$hackgenBase = "HackGen_${hackgenVersion}"
$extractDir = (Join-Path $toolsDir $hackgenBase)

$packageArgs = @{
  PackageName   = 'hackgen'
  Url           = "https://github.com/yuru7/HackGen/releases/download/${hackgenVersion}/${hackgenBase}.zip"
  Checksum      = 'f6a901b646e434d1763490ee46b4b06eca2825b4eb7efb90ef347319a407236d'
  ChecksumType  = 'sha256'
  UnzipLocation = $toolsDir
}

# Download and extract Zip
Install-ChocolateyZipPackage @packageArgs

# Install all ttf fonts
$hackgenFonts | ForEach-Object {
  'Installing {0}...' -f $_
  Install-ChocolateyFont (Join-Path $extractDir $_) | Out-Null
}
