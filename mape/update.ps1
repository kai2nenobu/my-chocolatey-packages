Import-Module au

function global:au_GetLatest {
  ## Find a latest version from a5m2 history page
  $regex = [regex]'(?i)^mape_([.\d]+)_.*\.zip$'
  $releases = 'https://api.github.com/repos/ipponshimeji/MAPE/contents/Releases?ref=master'
  $releases_info = Invoke-RestMethod -Uri $releases
  $latestRelease = $releases_info | Where-Object { $_.name -match $regex } `
    | Sort-Object { [System.Version]($regex.Match($_.name).Groups[1].Value) } -Descending `
    | Select-Object -First 1
  return @{
    Version = $regex.Match($latestRelease.name).Groups[1].Value
    URL32 = 'https://github.com/ipponshimeji/MAPE/raw/master/' + $latestRelease.path
  }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^\s*[$]url)\s*=.*" = "`${1} = '$($Latest.URL32)'"
      "(^\s*[$]checksum)\s*=.*" = "`${1} = '$($Latest.Checksum32)'"
    }
  }
}

$env:ChocolateyPackageName = 'mape'
$env:ChocolateyPackageFolder = '.'
Update-Package -NoReadme
