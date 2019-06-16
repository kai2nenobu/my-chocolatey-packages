# Kill running 'ssh-agent-wsl' processes.
$wsl = Get-Command wsl
if ($null -ne $wsl) {
  Write-Host "Kill all 'ssh-agent-wsl' processes..."
  # TODO: Kill 'ssh-agent-wsl' processes running in non-default distributions
  wsl pkill 'ssh-agent-wsl'
}
