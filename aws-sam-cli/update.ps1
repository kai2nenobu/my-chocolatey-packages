Import-Module au

$releases = 'https://api.github.com/repos/awslabs/aws-sam-cli/releases'

function global:au_GetLatest {
  ## Find a latest release and extract installer URL from GitHub Releases
  $releases_info = Invoke-RestMethod -Uri $releases
  foreach ($release in $releases_info) {
    if (-not $release.prerelease) {
      $version = $release.tag_name -replace "^v",""
      $url64 = $release.assets | Where-Object { $_.name -like "AWS_SAM_CLI_64*.msi" } | Select-Object -First 1 -Expand browser_download_url
      return @{
        Version = $version
        URL64 = $url64
      }
    }
  }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^\s*Url64bit)\s*=.*" = "`${1} = '$($Latest.URL64)'"
      "(^\s*Checksum64)\s*=.*" = "`${1} = '$($Latest.Checksum64)'"
    }
  }
}

Update-Package -ChecksumFor 64 -NoReadme
