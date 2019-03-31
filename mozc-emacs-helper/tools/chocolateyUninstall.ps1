Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

## Remove a shim to mozc_emacs_helper.exe
Uninstall-BinFile -Name mozc_emacs_helper
