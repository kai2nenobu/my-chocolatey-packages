Import-Module au

# Load a helper script
$helper = Join-Path $PSScriptRoot 'update_helper.ps1'
. $helper

function global:au_GetLatest {
  $version = Find-PleiadesVersion
  return @{
    Version = $version.semver
    ChecksumType64 = 'md5'
    Streams = (Get-PleiadesStreams $version.array)
  }
}

function global:au_SearchReplace {
  @{
    "pleiades-streams.nuspec" = @{
      '(?i)(^\s*\<title\>).*(\<\/title\>)' = "`${1}$($Latest.Title)`${2}"
    }
    "tools\chocolateyInstall.ps1" = @{
      "(^\s*[$]packageName)\s*=.*" = "`${1} = '$($Latest.PackageName)'"
      "(^\s*[$]url)\s*=.*" = "`${1} = '$($Latest.URL64)'"
      "(^\s*[$]checksum)\s*=.*" = "`${1} = '$($Latest.Checksum64)'"
      "(^\s*[$]shortcutName)\s*=.*" = "`${1} = '$($Latest.Title).lnk'"
    }
  }
}

Update-Package -NoReadme -ChecksumFor 64
