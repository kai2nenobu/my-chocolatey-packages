Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop';  # stop on all errors

[string[]]$languages = 'platform', 'java'
[string[]]$editions = 'standard', 'full'

$Pleiades = @{
  Version='2018.09.20181004'
  platform=@{
    Title='Pleiades All in One Platform'
    Tag=''
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-32bit_20181004.zip'
      Checksum='1c23d9a9e67b944ff526b67db704858c'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-64bit_20181004.zip'
      Checksum64='d8f293ccc383e2b71457701e8a5afefe'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-32bit-jre_20181004.zip'
      Checksum='4d1ce8adc329dcfff645ea5ad0eb8461'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-64bit-jre_20181004.zip'
      Checksum64='3f1e699d2da93db59d0309accf58a8f3'
    }
  }
  java=@{
    Title='Pleiades All in One Java'
    Tag='java'
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-32bit_20181004.zip'
      Checksum='0be5a93235e2a192bdaa3705a1d2e001'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-64bit_20181004.zip'
      Checksum64='dbe7d3ad89a809c07d91d91c52239bac'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-32bit-jre_20181004.zip'
      Checksum='ad8774957171ed38580467b8c563b0f5'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-64bit-jre_20181004.zip'
      Checksum64='7f63a0cedf87d083f3c4249cf7700fdd'
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
        -replace '{{Url64}}', $Pleiades[$lang][$ed].Url64 `
        -replace '{{Checksum64}}', $Pleiades[$lang][$ed].Checksum64
    } | Out-File $targetScript -Encoding UTF8
    ## Packaging
    choco pack $targetNuspec
  }
}
