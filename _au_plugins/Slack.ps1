# Heavily inspired from https://github.com/majkinetor/au/blob/master/AU/Plugins/Gitter.ps1
<#
    Copyright 2019-2020 Tsunenobu Kai

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#>
<#
.SYNOPSIS
  Publishes the package update status to slack.
.PARAMETER WebHookUrl
  This is the cusotm webhook url for Slack Incoming WebHooks app.
.PARAMETER BuildUrl
  The url to a CI build which checked this update info (typically in AppVeyor).
.PARAMETER MessageFormat
  The format of the message that is meant to be published on slack.
  {0} = The total number of automated packages.
  {1} = The number of updated packages,
  {2} = The number of published packages.
  {3} = The number of failed packages.
  {4} = The url to the github gist.
#>
param(
  $Info,
  [string]$WebHookUrl,
  [string]$BuildUrl = '',
  [string]$MessageFormat = "[Update Status:{0} packages. {1} Updated, {2} Published, {3} Failed]`n{4}",
  [bool]$OnlyWhenChange = $false
)

if (!$WebHookUrl) {
  # If we don't have a webhookurl we can't push status messages, so ignore.
  Write-Host "No WebHookUrl is specified, skipping"
  return
}

$updatedPackages = @($Info.result.updated).Count
$publishedPackages = @($Info.result.pushed).Count
$ignoredPackages = @($Info.result.ignored).Count
$failedPackages = $Info.error_count.total
$gistUrl = $Info.plugin_results.Gist -split '\n' | select -Last 1
$packageCount = $Info.result.all.Length

$messageHeader = if ($BuildUrl) { "<$BuildUrl|Update AU Packages>" } else { 'Update AU Packages' }
$message = ($MessageFormat -f $packageCount, $updatedPackages, $publishedPackages, $failedPackages, $gistUrl)
$color = if ($failedPackages -gt 0) { 'danger' }
elseif ($publishedPackages -gt 0) { 'good' }
elseif ($ignoredPackages -gt 0) { 'warning' }
else { 
  if ($OnlyWhenChange) {
    Write-Host "Don't publish a message because no packages are changed."
    return
  }
  '#00b4ff'
}

$body = @{
  text        = ''
  attachments = @(
    @{
      color  = $color
      fields = @(
        @{
          value = "{0}`n{1}" -f $messageHeader, $message
          short = $False
        }
      )
    }
  )
} | ConvertTo-Json -Compress -Depth 10

$arguments = @{
  Uri         = $WebHookUrl
  Method      = 'Post'
  ContentType = 'application/json'
  Body        = [Text.Encoding]::UTF8.GetBytes($body)
}

"Submitting message to slack"
Invoke-RestMethod @arguments > $null
"Message submitted to slack"
