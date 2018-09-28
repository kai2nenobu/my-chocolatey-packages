$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$installPath = Join-Path (Get-ToolsLocation) $packageName

## Delete installed netupvim
if (Test-Path $installPath) {
    Remove-Item -Path $installPath -Recurse -Force
}
