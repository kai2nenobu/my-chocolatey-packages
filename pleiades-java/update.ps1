Import-Module au

# Load a common script
$common = Join-Path $PSScriptRoot '..\_pleiades\common.ps1'
. "$common"

function global:au_GetLatest {
  $version = Find-PleiadesVersion
  return @{
    Version = $version.semver
    URL64 = 'http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/{0}/pleiades-{0}-{1}-java-win-64bit_{2}.zip' -f $version.array
    ChecksumType64 = 'md5'
  }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(^\s*[$]url)\s*=.*" = "`${1} = '$($Latest.URL64)'"
      "(^\s*[$]checksum)\s*=.*" = "`${1} = '$($Latest.Checksum64)'"
    }
  }
}

Update-Package -NoReadme -ChecksumFor 64
