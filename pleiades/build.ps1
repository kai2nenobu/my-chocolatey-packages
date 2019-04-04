Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop';  # stop on all errors

[string[]]$languages = 'platform', 'java'
[string[]]$editions = 'standard', 'full'

$Pleiades = @{
  Version='2019.03.20190324-pre'
  platform=@{
    Title='Pleiades All in One Platform'
    Tag=''
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2019-03-platform-win-64bit_20190324.zip'
      Checksum='d93977640b71c5fbfb5b11e41c6d5734'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2019-03-platform-win-64bit-jre_20190324.zip'
      Checksum='16f07b6ea958512b167beed6f71492b2'
    }
  }
  java=@{
    Title='Pleiades All in One Java'
    Tag='java'
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2019-03-java-win-64bit_20190324.zip'
      Checksum='be47780f9cc86d28e7ead209a0fbf250'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2019-03-java-win-64bit-jre_20190324.zip'
      Checksum='457e9c0a57bb6cced22fc973d73ab6a1'
    }
  }
}

function GetPackageId([string]$language, [string]$edition) {
  <#
  Calculate a package id for chocolatey from pleiades language and edition.
  #>
  if ($edition -ceq 'standard') {
    $id = 'pleiades-' + $language
  } elseif ($edition -ceq 'full') {
    $id = 'pleiades-' + $language + '-full'
  } else {
    raise ('"%s" is an invalid edition' -f $edition)
  }
  return $id
}

## Main ##

$templateNuspec = '.\template\pleiades.tmpl.nuspec'
$templateScript = '.\template\ChocolateyInstall.tmpl.ps1'
foreach ($lang in $languages) {
  foreach ($ed in $editions) {
    $PackageId = GetPackageId $lang $ed
    ## Generate a nuspec file
    $targetNuspec = "${PackageId}.nuspec"
    Get-Content -Encoding UTF8 $templateNuspec | % {
      $_ -replace '{{PackageVersion}}', $Pleiades.Version `
        -replace '{{PackageId}}', $PackageId `
        -replace '{{PackageTitle}}', $Pleiades[$lang].Title `
        -replace '{{PackageTag}}', $Pleiades[$lang].Tag
    } | Out-File $targetNuspec -Encoding UTF8
    ## Generate a install script
    $targetScript = '.\tools\ChocolateyInstall.ps1'
    Get-Content -Encoding UTF8 $templateScript | % {
      $_  -replace '{{PackageTitle}}', $Pleiades[$lang].Title `
        -replace '{{Url}}', $Pleiades[$lang][$ed].Url `
        -replace '{{Checksum}}', $Pleiades[$lang][$ed].Checksum `
    } | Out-File $targetScript -Encoding UTF8
    ## Packaging
    if ([string]::IsNullOrEmpty($env:PACKAGE_VERSION)) {
      choco pack $targetNuspec
    } else {
      choco pack $targetNuspec --version $env:PACKAGE_VERSION
    }
  }
}
