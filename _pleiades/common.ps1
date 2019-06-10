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
