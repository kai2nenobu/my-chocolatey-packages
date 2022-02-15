function Find-PleiadesVersion {
  <#
  .SYNOPSIS
  Find the latest release version from pleiades download Page
  #>
  $downloadBase = 'https://mergedoc.osdn.jp/'
  ## Find the latest release year in a top page
  $topPageUrl = $downloadBase + 'pleiades.html'
  $topPage = Invoke-WebRequest -Uri $topPageUrl -UseBasicParsing
  $latestLink = $topPage.Links | Where-Object { $_.href -like 'pleiades_distros20*.html' } | Select-Object -First 1 -Expand href
  ## Find the latest version like "20YY-MM.20YYMMDD"
  $downloadUrl = $downloadBase + $latestLink
  $downloadPage = Invoke-WebRequest -Uri $downloadUrl -UseBasicParsing
  $versionPattern = [regex]'^\s*(20\d{2})-(\d{2})\.(20\d{6})'
  $latestVersionString = $downloadPage.Content -split "`n" `
  | Where-Object { $_ -match $versionPattern } `
  | Select-Object -First 1
  if ($latestVersionString -eq '2021-09.20210629') {
    # Fix a typo in upstream
    $latestVersionString = '2021-06.20210629'
  }
  $match = $versionPattern.Match($latestVersionString)
  $latestVersion = $match.Groups[3].Value
  $semverVersion = "$($match.Groups[1]).$($match.Groups[2]).$($match.Groups[3])"
  $versionArray = @($match.Groups[1].Value, $match.Groups[2].Value, $match.Groups[3].Value)
  return @{
    original = $latestVersion
    semver   = $semverVersion
    array    = $versionArray
  }
}

function Get-PleiadesZipUrl {
  <#
  .SYNOPSIS
  Format a download URL for pleiades zip
  #>
  [CmdletBinding()]
  param(
    [string]$Name,
    [array]$VersionArray,
    [boolean]$FullEdition = $false
  )
  $formatParams = @()
  $formatParams += $VersionArray
  $formatParams += $Name
  if ($FullEdition) {
    $formatParams += '-jre'
  }
  else {
    $formatParams += ''
  }
  return 'https://ftp.jaist.ac.jp/pub/mergedoc/pleiades/{0}/pleiades-{0}-{1}-{3}-win-64bit{4}_{2}.zip' -f $formatParams
}

function Get-PleiadesTitle {
  <#
  .SYNOPSIS
  Format a title for pleiades package
  #>
  [CmdletBinding()]
  param(
    [string]$Name,
    [boolean]$FullEdition = $false
  )
  $formatParams = @()
  $formatParams += (Get-Culture).TextInfo.ToTitleCase($Name)
  if ($FullEdition) {
    $formatParams += 'Full'
  }
  else {
    $formatParams += 'Standard'
  }
  return 'Pleiades All in One {0} {1} Edition' -f $formatParams
}


function Get-PleiadesStream {
  <#
  .SYNOPSIS
  Construct a stream for specific one
  #>
  [CmdletBinding()]
  param(
    [string]$StreamName,
    [array]$VersionArray
  )
  $name = $StreamName -replace '-.*$', ''
  $full = $StreamName -match '-full$'
  return @{
    PackageName = "pleiades-$StreamName"
    URL64       = (Get-PleiadesZipUrl -Name $name -VersionArray $VersionArray -FullEdition $full)
    Title       = (Get-PleiadesTitle -Name $name -FullEdition $full)
  }
}

function Get-PleiadesStreams {
  <#
  .SYNOPSIS
  Construct streams for various languages and editions
  #>
  [CmdletBinding()]
  param(
    [array]$VersionArray
  )
  $packages = @(
    'platform'
    'platform-full'
    'java'
    'java-full'
  )
  $streams = [ordered] @{}
  foreach ($package in $packages) {
    $streams.Add($package, (Get-PleiadesStream $package $VersionArray))
  }
  return $streams
}
