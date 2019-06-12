Import-Module au

function global:au_GetLatest {
  ## Download a latest busybox exe
  $latestExe = 'https://frippery.org/files/busybox/busybox.exe'
  $latestExePath = Join-Path $env:TEMP 'busybox.exe'
  Invoke-WebRequest -Uri $latestExe -OutFile $latestExePath
  ## Extract a version string from busybox.exe output
  ##   ex) v1.31.0-FRP-3025-gc01300361 => 1.31.0.3025
  $versionString = & $latestExePath | Select-Object -First 1
  $regex = [regex]'(?i)^busybox\s+v(\d+)\.(\d+)\.(\d+)-FRP-(\d+).*$'
  $version = $versionString -replace $regex,'$1.$2.$3.$4'
  return @{
    Version = $version
    URL32 = $latestExe
    URL64 = $latestExe -replace 'busybox\.exe','busybox64.exe'
  }
}

function global:au_BeforeUpdate() {
  # Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  ## Nothing to replace
  @{
  }
}

Update-Package -NoReadme -ChecksumFor none
