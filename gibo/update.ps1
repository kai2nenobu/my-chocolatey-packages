import-module au

function global:au_GetLatest {
  ## Find a latest release and extract installer URL from GitHub tags
  $tag_list = gh api 'repos/simonwhitaker/gibo/tags' | ConvertFrom-Json
  foreach ($tag in $tag_list) {
    $name = $tag.name
    # Skip non semver tags
    if ($name -notmatch '^\d+\.\d+\.\d+$') {
      continue
    }
    return @{
      Version = $name
      URL32 = "https://github.com/simonwhitaker/gibo/archive/${name}.zip"
    }
  }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
   @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(^\s+url:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(^\s+checksum:).*"        = "`${1} $($Latest.Checksum32)"
        }
    }
}

Update-Package -ChecksumFor none
