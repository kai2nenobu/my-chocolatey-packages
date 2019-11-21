import-module au

function global:au_GetLatest {
  ## Find a latest release and extract installer URL from GitHub Releases
  $releases = 'https://api.github.com/repos/rupor-github/wsl-ssh-agent/releases'
  $releases_info = Invoke-RestMethod -Uri $releases
  foreach ($release in $releases_info) {
    if (-not $release.prerelease) {
      $version = $release.tag_name -replace "^v",""
      $url64 = $release.assets | Where-Object { $_.name -eq "wsl-ssh-agent.7z" } | Select-Object -First 1 -Expand browser_download_url
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
