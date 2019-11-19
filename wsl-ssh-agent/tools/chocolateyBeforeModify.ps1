Write-Host "Kill all 'wsl-ssh-agent' processes..."
## TODO: Gracefully stop wsl-ssh-agent process
Stop-Process -Name "[w]sl-ssh-agent-gui" -Force
