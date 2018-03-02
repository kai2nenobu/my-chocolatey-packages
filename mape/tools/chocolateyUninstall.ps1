$ErrorActionPreference = 'Stop'; # stop on all errors

## Include common configurations
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$scriptDirectory\common.ps1"

## Remove a shortcut for GUI program
Remove-Item $guiShortcut
