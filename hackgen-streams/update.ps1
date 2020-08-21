import-module au

function global:au_GetLatest {
  ## Find a latest release and extract zip URL from GitHub Releases
  $releases = 'https://api.github.com/repos/yuru7/HackGen/releases'
  $releases_info = Invoke-RestMethod -Uri $releases
  foreach ($release in $releases_info) {
    $tag = $release.tag_name
    if ($release.prerelease) {
      Write-Warning ('Ignore prerelease version: "{0}"' -f $tag)
      continue
    }
    if (-not ($tag -match '^v[0-9]+\.[0-9]+\.[0-9]+')) {
      Write-Warning ('Ignore invalid tag name: "{0}"' -f $tag)
      continue
    }
    $tag = $release.tag_name
    $version = $tag -replace "^v",""
    $normalZip = $release.assets | Where-Object { $_.name -eq "HackGen_${tag}.zip" } | Select-Object -First 1 -Expand browser_download_url
    $nerdZip = $release.assets | Where-Object { $_.name -eq "HackGenNerd_${tag}.zip" } | Select-Object -First 1 -Expand browser_download_url
    return @{
      Streams = [ordered] @{
        'normal' = @{
          PackageName = 'hackgen'
          Tag = $tag
          Version = $version
          URL32 = $normalZip
          Prefix = 'HackGen'
        }
        'nerd' = @{
          PackageName = 'hackgen-nerd'
          Tag = $tag
          Version = $version
          URL32 = $nerdZip
          Prefix = 'HackGenNerd'
        }
      }
    }
  }
}

function global:au_SearchReplace {
  # Replace font names in common.ps1
  if ($Latest.Stream -eq 'nerd') {
    $fontReplacement = 'HackGen${1}Nerd${3}-'
  } else {
    $fontReplacement = 'HackGen${1}${3}-'
  }
  @{
    ".\hackgen-streams.nuspec" = @{
      '(/HackGen/blob/)[^/<]*' = "`${1}$($Latest.Tag)"
      '(/HackGen/releases/tag/)[^/<]*' = "`${1}$($Latest.Tag)"
    }
    ".\tools\ChocolateyInstall.ps1" = @{
      '^([$]hackgenVersion\s*=).*' = "`${1} '$($Latest.Tag)'"
      '^([$]hackgenBase\s*=).*' = "`${1} '$($Latest.Prefix)_$($Latest.Tag)'"
      '(PackageName\s*=).*' = "`${1} '$($Latest.PackageName)'"
      '(Checksum\s*=).*' = "`${1} '$($Latest.Checksum32)'"
    }
    ".\tools\common.ps1" = @{
      'HackGen(35)?(Nerd)?(Console)?-' = $fontReplacement
    }
  }
}

Update-Package -NoReadme
