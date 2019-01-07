Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop';  # stop on all errors

[string[]]$languages = 'platform', 'java'
[string[]]$editions = 'standard', 'full'

$Pleiades = @{
  Version='2018.12.20181224'
  platform=@{
    Title='Pleiades All in One Platform'
    Tag=''
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2018-12-platform-win-64bit_20181224.zip'
      Checksum='4907793b66f5c769019e21aa587f480a'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2018-12-platform-win-64bit-jre_20181224.zip'
      Checksum='d460d0cbc940fdb3a0067ea403b3d41a'
    }
  }
  java=@{
    Title='Pleiades All in One Java'
    Tag='java'
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2018-12-java-win-64bit_20181224.zip'
      Checksum='1e1da779246066effa30725dfed436b0'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2019/pleiades-2018-12-java-win-64bit-jre_20181224.zip'
      Checksum='d672ba8b3c0ee6f8b08ee93cf95a061d'
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
    choco pack $targetNuspec
  }
}
