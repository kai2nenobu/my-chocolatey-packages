import-module au

function global:au_GetLatest {
  ## Find a latest release and extract installer URL from GitHub Releases
  $releases_info = gh api 'repos/rupor-github/wsl-ssh-agent/releases' | ConvertFrom-Json
  foreach ($release in $releases_info) {
    if (-not $release.prerelease) {
      $version = $release.tag_name -replace "^v",""
      $url64 = $release.assets | Where-Object { $_.name -eq "wsl-ssh-agent.zip" } | Select-Object -First 1 -Expand browser_download_url
      return @{
        Version = $version
        URL64 = $url64
      }
    }
  }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
   @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
    }
}

Update-Package -NoReadme -ChecksumFor none
