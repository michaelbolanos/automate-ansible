# Automate Ansible

---

## 🎯 **Key Features**

✅ **Automated Ansible Playbook Execution** - Deploy configurations seamlessly.

✅ **Network & WAN Status Checks** - Monitor connectivity in real-time.

✅ **WireGuard Connection Manager** - Automate VPN connections securely.

✅ **Interactive Whiptail Menu** - Simple navigation for system tasks.

✅ **Windows PowerShell Remoting Support** - Automate Windows configurations.

---

## 🛀 **Windows Automation: PowerShell Remoting**

The `/scripts/windows` subdirectory includes a script to **enable PowerShell remoting** for Ansible control:

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

For additional Windows automation, see the **Ansible Windows Documentation**.

---

## 🛠️ **Installation**

```bash
# Clone the repository
git clone git@github.com:michaelbolanos/automate-ansible.git

# Navigate to the directory
cd automate-ansible

# Run the main menu script
./scripts/ansible-manage.sh
```

---

## 🚀 **Usage**

Run the script to access the interactive menu:

```bash
./scripts/ansible-manage.sh
```

---

## 🏆 **Project History**

(Provide details about updates, milestones, or changelogs.)

---

## 🔒 **Security & Compliance**

✅ **Encrypted WireGuard configurations**  
✅ **Minimal dependencies** to reduce attack surface  
✅ **No cloud reliance** – operates entirely on local systems  

---


---

## 📜 **License**

This project is licensed under the [MIT License](LICENSE).

---

## 🌎 **Connect with Me**

[![GitHub](https://img.shields.io/badge/GitHub-michaelbolanos-black?style=for-the-badge&logo=github)](https://github.com/michaelbolanos)  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/michaeljbolanos/)  

---

*Happy Automating*

