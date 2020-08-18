$ErrorActionPreference = 'Stop'

## Include common configurations
$toolsDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. (Join-Path $toolsDir 'common.ps1')

$hackgenBase = 'HackGen_v2.0.0'
$archivePath = (Join-Path $toolsDir "${hackgenBase}.zip")
$extractDir = (Join-Path $toolsDir $hackgenBase)


$packageArgs = @{
  PackageName    = 'hackgen'
  FileFullPath   = $archivePath
  Destination    = $toolsDir
}

# Extract Zip
Get-ChocolateyUnzip @packageArgs

# Install all ttf fonts
$hackgenFonts | ForEach-Object {
 'Installing {0}...' -f $_
  Install-ChocolateyFont (Join-Path $extractDir $_) | Out-Null
}
