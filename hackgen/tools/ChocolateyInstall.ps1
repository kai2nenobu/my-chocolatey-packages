$ErrorActionPreference = 'Stop'

## Include common configurations
$toolsDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. (Join-Path $toolsDir 'common.ps1')

$hackgenVersion = 'v2.0.0'
$hackgenBase = "HackGen_${hackgenVersion}"
$extractDir = (Join-Path $toolsDir $hackgenBase)

$packageArgs = @{
  PackageName   = 'hackgen'
  Url           = "https://github.com/yuru7/HackGen/releases/download/${hackgenVersion}/${hackgenBase}.zip"
  Checksum      = '5ad5c40f2476cd37bf48a496da3ebc5f08c2d817ea4d672fe39c6cb93d91010a'
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
