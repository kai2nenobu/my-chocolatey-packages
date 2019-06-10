Import-Module au

function global:au_GetLatest {
  ## Find a latest release and extract zip URL from a5m2 Home Page
  $linkRegex = [regex]'download/a5m2_([^_]*)_x64_r\.zip'
  $homepage = 'https://a5m2.mmatsubara.com/'
  $body = Invoke-WebRequest -Uri $homepage -UseBasicParsing
  $link = $body.Links | Where-Object { $_.href -match $linkRegex } | Select-Object -First 1 -Expand href
  $version = $linkRegex.Match($link).Groups[1]
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
