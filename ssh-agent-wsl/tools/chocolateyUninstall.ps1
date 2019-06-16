$ErrorActionPreference = 'Stop'

# Remove all of extracted files
Uninstall-ChocolateyZipPackage `
  -PackageName 'ssh-agent-wsl' `
  -ZipFileName 'ssh-agent-wsl.7z'
