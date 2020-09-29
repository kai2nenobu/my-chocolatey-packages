function Find-PleiadesVersion {
  <#
  .SYNOPSIS
  Find the latest release version from pleiades download Page
  #>
  $downloadUrl = 'https://ftp.jaist.ac.jp/pub/mergedoc/pleiades/'
  $downloadPage = Invoke-WebRequest -Uri $downloadUrl -UseBasicParsing
  ## Find the directory for latest year
  $latestYear = $downloadPage.Links | Where-Object { $_.href -like '20*/' } | Select-Object -Last 1 -Expand href
  $latestUrl = $downloadUrl + $latestYear
  $latestPage = Invoke-WebRequest -Uri $latestUrl -UseBasicParsing
  ## Find the latest version
  $versionPattern = [regex]'pleiades-(20\d{2})-(\d{2})-platform-win-64bit_(20\d{6}).zip'
  $latestLink = $latestPage.Links `
    | Where-Object { $_.href -match $versionPattern } `
    | Select-Object -Last 1 -Expand href
  $match = $versionPattern.Match($latestLink)
  $latestVersion = $match.Groups[3]
  $semverVersion = "$($match.Groups[1]).$($match.Groups[2]).$($match.Groups[3])"
  $versionArray = @($match.Groups[1], $match.Groups[2], $match.Groups[3])
  return @{
    original = $latestVersion
    semver = $semverVersion
    array = $versionArray
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
    [boolean]$FullEdition=$false
  )
  $formatParams = @()
  $formatParams += $VersionArray
  $formatParams += $Name
  if ($FullEdition) {
    $formatParams += '-jre'
  } else {
    $formatParams += ''
  }
  return 'http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/{0}/pleiades-{0}-{1}-{3}-win-64bit{4}_{2}.zip' -f $formatParams
}

function Get-PleiadesTitle {
  <#
  .SYNOPSIS
  Format a title for pleiades package
  #>
  [CmdletBinding()]
  param(
    [string]$Name,
    [boolean]$FullEdition=$false
  )
  $formatParams = @()
  $formatParams += (Get-Culture).TextInfo.ToTitleCase($Name)
  if ($FullEdition) {
    $formatParams += 'Full'
  } else {
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
  $name = $StreamName -replace '-.*$',''
  $full = $StreamName -match '-full$'
  return @{
    PackageName = "pleiades-$StreamName"
    URL64 = (Get-PleiadesZipUrl -Name $name -VersionArray $VersionArray -FullEdition $full)
    Title = (Get-PleiadesTitle -Name $name -FullEdition $full)
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
