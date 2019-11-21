Write-Host "Kill all 'wsl-ssh-agent-gui' processes..."
## TODO: Gracefully stop wsl-ssh-agent-gui process
Stop-Process -Name "[w]sl-ssh-agent-gui" -Force
