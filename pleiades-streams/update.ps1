Import-Module au

# Load a common script
function Find-PleiadesVersion {
  ## Find a latest release and extract zip URL from pleiades home Page
  $root = 'http://mergedoc.osdn.jp/'
  $homeUrl = $root + 'pleiades.html'
  $homePage = Invoke-WebRequest -Uri $homeUrl -UseBasicParsing
  $latestLink = $homePage.Links | Where-Object { $_.href -like 'pleiades_distros*.html' } | Select-Object -First 1 -Expand href
  ## Latest pleiades distribution page
  $latestUrl = $root + $latestLink
  $latestPage = Invoke-WebRequest -Uri $latestUrl -UseBasicParsing
  ## Find a latest version
  $versionPattern = [regex]'^\s*(20\d\d-\d\d\.20\d{6})'
  $latestVersion = $LatestPage.Content -split '\r?\n' | Select-String -Pattern $versionPattern | Select-Object -First 1
  $latestVersion = $versionPattern.Match($latestVersion).Groups[1] # trim
  $semverVersion = $latestVersion -replace '-','.'
  $versionArray = $semverVersion -split '\.'
  if ($versionArray.Count -ne 3) {
    throw 'Version Number is invalid: {0}' -f $semverVersion
  }
  return @{
    original = $latestVersion
    semver = $semverVersion
    array = $versionArray
  }
}

function global:au_GetLatest {
  $version = Find-PleiadesVersion
  return @{
    Streams = [ordered] @{
      'platform' = @{
        Version = $version.semver
        URL64 = 'http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/{0}/pleiades-{0}-{1}-platform-win-64bit_{2}.zip' -f $version.array
        ChecksumType64 = 'md5'
      }
      'java' = @{
        Version = $version.semver
        URL64 = 'http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/{0}/pleiades-{0}-{1}-java-win-64bit_{2}.zip' -f $version.array
        ChecksumType64 = 'md5'
      }
    }
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
