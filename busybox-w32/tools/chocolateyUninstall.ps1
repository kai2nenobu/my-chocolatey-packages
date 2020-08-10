Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

## Remove a shim to busybox.exe
Uninstall-BinFile -Name busybox
