import-module au

function global:au_GetLatest {
  ## Find a latest release and extract installer URL from GitHub Releases
  $releases = 'https://api.github.com/repos/motemen/ghq/releases'
  $releases_info = Invoke-RestMethod -Uri $releases
  foreach ($release in $releases_info) {
    if (-not $release.prerelease) {
      $version = $release.tag_name -replace "^v",""
      $url64 = $release.assets | Where-Object { $_.name -like "*_windows_amd64.zip" } | Select-Object -First 1 -Expand browser_download_url
      $url32 = $release.assets | Where-Object { $_.name -like "*_windows_386.zip" } | Select-Object -First 1 -Expand browser_download_url
      return @{
        Version = $version
        URL64 = $url64
        URL32 = $url32
      }
    }
  }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
   @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
    }
}

Update-Package -NoReadme -ChecksumFor none
