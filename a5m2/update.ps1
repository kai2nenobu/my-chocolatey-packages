Import-Module au

function global:au_GetLatest {
  ## Find a latest version from a5m2 history page
  $versionRegex = [regex]'(?i)^(?:\xef\xbb\xbf)?version\s*(\d+\.\d+\.\d+)' # Allow beginning BOM
  $homepage = 'https://a5m2.mmatsubara.com/'
  $latestLine = Invoke-WebRequest -Uri ($homepage + 'document/history.txt') -UseBasicParsing `
    | Select-Object -ExpandProperty Content `
    | % { $_ -split '\r?\n'  } `
    | ? { $_ -match  $versionRegex } `
    | select -First 1
  $version = $versionRegex.Match($latestLine).Groups[1]
  return @{
    Version = $version
    URL32 = "{0}download/a5m2_{1}_x86.zip" -f $homepage,$version
    URL64 = "{0}download/a5m2_{1}_x64.zip" -f $homepage,$version
  }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^\s*[$]url)\s*=.*" = "`${1} = '$($Latest.URL32)'"
      "(^\s*[$]checksum)\s*=.*" = "`${1} = '$($Latest.Checksum32)'"
      "(^\s*[$]url64)\s*=.*" = "`${1} = '$($Latest.URL64)'"
      "(^\s*[$]checksum64)\s*=.*" = "`${1} = '$($Latest.Checksum64)'"
    }
  }
}

$env:ChocolateyPackageName = 'a5m2'
$env:ChocolateyPackageFolder = '.'
Update-Package -NoReadme
