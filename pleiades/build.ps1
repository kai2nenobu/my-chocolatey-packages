Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop';  # stop on all errors

[string[]]$languages = 'platform', 'java'
[string[]]$editions = 'standard', 'full'

$Pleiades = @{
  Version='2018.09.20180925'
  platform=@{
    Title='Pleiades All in One Platform'
    Tag=''
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-32bit_20180925.zip'
      Checksum='3a6e98fe8a448d9ca7e94bf3beaf9a25'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-64bit_20180925.zip'
      Checksum64='2bcc5e3b6688d3f6784c93468dba56d0'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-32bit-jre_20180925.zip'
      Checksum='4b1fd4a85547c80b5a8133493d83e8ee'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-platform-win-64bit-jre_20180925.zip'
      Checksum64='559c7625fa41965b49490f46bfaf8a7c'
    }
  }
  java=@{
    Title='Pleiades All in One Java'
    Tag='java'
    standard=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-32bit_20180925.zip'
      Checksum='88532187714f951f90486a85a54993f9'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-64bit_20180925.zip'
      Checksum64='d36b8e591b8eed87f465c0106dd31615'
    }
    full=@{
      Url='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-32bit-jre_20180925.zip'
      Checksum='1e6fc190144175a2c49c294ea475ba45'
      Url64='http://ftp.jaist.ac.jp/pub/mergedoc/pleiades/2018/pleiades-2018-09-java-win-64bit-jre_20180925.zip'
      Checksum64='7963c089d1cd76372e2f33500df6f3ee'
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
      $_ -replace '{{Url}}', $Pleiades[$lang][$ed].Url `
        -replace '{{Checksum}}', $Pleiades[$lang][$ed].Checksum `
        -replace '{{Url64}}', $Pleiades[$lang][$ed].Url64 `
        -replace '{{Checksum64}}', $Pleiades[$lang][$ed].Checksum64
    } | Out-File $targetScript -Encoding UTF8
    ## Packaging
    choco pack $targetNuspec
  }
}
