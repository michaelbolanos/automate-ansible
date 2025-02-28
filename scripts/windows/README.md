## 🖥️ Windows Setup

### 🔧 Enabling WinRM for Remote Management with PowerShell 

WinRM (Windows Remote Management) is required for Ansible to manage Windows hosts.  
Therefore, let's set that up using PowerShell.


### ⚙ Enabling PowerShell Remoting

```powershell
# Enable PowerShell Remoting
Enable-PSRemoting -Force

# Allow basic authentication
Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true

# Allow unencrypted communication (Optional: Enable only if using SSL)
Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true

# Set up firewall rule for WinRM
New-NetFirewallRule -DisplayName "WinRM HTTP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5985

# Restart WinRM service
Restart-Service WinRM
```

### 🔑 Configuring a WinRM User

Create an administrator user for Ansible:

```powershell
New-LocalUser -Name "ansibleadmin" -Password (ConvertTo-SecureString "YourSecurePassword" -AsPlainText -Force) -FullName "Ansible Admin" -Description "User for Ansible Management"
Add-LocalGroupMember -Group "Administrators" -Member "ansibleadmin"
```

### 🛠️ Verifying WinRM

To confirm WinRM is running:

```powershell
Test-WSMan
```

If correctly configured, this should return a valid response.
