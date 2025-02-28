# Enable PowerShell Remoting
Enable-PSRemoting -Force

# Allow basic authentication (Optional: Enable only if needed)
Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true

# Allow unencrypted communication only if required (Recommended to disable in production)
# Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $false

# Configure WinRM for HTTPS (if SSL certificate is available)
# winrm quickconfig -transport:https

# Set up a firewall rule for WinRM over HTTP (Port 5985)
New-NetFirewallRule -DisplayName "WinRM HTTP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5985 -Profile Any

# (Optional) Set up a firewall rule for WinRM over HTTPS (Port 5986)
# New-NetFirewallRule -DisplayName "WinRM HTTPS" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5986 -Profile Any

# Set trusted hosts (Modify accordingly, '*' allows all, use specific IPs in production)
Set-Item WSMan:\localhost\Client\TrustedHosts -Value '*' -Force

# Restart WinRM service
Restart-Service WinRM

# Confirm WinRM is listening
winrm enumerate winrm/config/listener
