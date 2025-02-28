# Automate Ansible - Interactive Bash Automation

![Automate Ansible](https://raw.githubusercontent.com/michaelbolanos/automate-ansible/main/assets/banner.png)

## 🚀 Overview
**Automate Ansible** is an interactive Bash script designed to streamline system administration tasks, including running Ansible playbooks, managing network settings, checking system information, and automating WireGuard connections.

🔹 **Automated Ansible Playbook Execution**
🔹 **Network & WAN Status Checks**
🔹 **WireGuard Connection Manager**
🔹 **Matrix Screensaver for Fun**
🔹 **Interactive Whiptail Menu**

## 📜 Features
- **System Information Display**: Uses `neofetch` to provide system details.
- **WAN & Network Connectivity Check**: Pings external servers and fetches the WAN IP.
- **Run Ansible Playbooks**: Execute playbooks from predefined directories with or without SSH password prompts.
- **Inventory File Management**: Edit Ansible inventory files with `nano`.
- **WireGuard VPN Control**: Connect, disconnect, and view active connections.
- **Matrix Screensaver**: Runs `cmatrix` for a cool visual effect.

## 🛠️ Installation
Ensure the required dependencies are installed:
```bash
sudo apt update && sudo apt install -y whiptail asciiquarium cmatrix neofetch nano ansible-playbook sudo grep wg curl
```

Clone the repository:
```bash
git clone git@github.com:michaelbolanos/automate-ansible.git && cd automate-ansible
```

Make the script executable:
```bash
chmod +x automate-ansible.sh
```

Run the script:
```bash
./automate-ansible.sh
```

## 📸 Screenshots
### Interactive Menu
![Menu](https://raw.githubusercontent.com/michaelbolanos/automate-ansible/main/assets/menu.png)

### Network Check
![Network](https://raw.githubusercontent.com/michaelbolanos/automate-ansible/main/assets/network.png)

## 📝 Usage
Once inside the menu, select an option using the arrow keys and press **Enter** to execute:
1️⃣ **Exit to Terminal** - Close the script.
2️⃣ **Show System Info** - Display hardware and OS information.
3️⃣ **Check WAN & Network** - Verify internet connectivity.
4️⃣ **Open Text Editor** - Launch `nano`.
5️⃣ **Reboot System** - Restart the machine.
6️⃣ **Run Ansible Playbook** - Execute a playbook from the available list.
9️⃣ **Edit Ansible Inventory Files** - Modify inventory files.
🔟 **Check for Passwords in .ini Files** - Security scan for stored credentials.

## 🛡 Security Considerations
- Ensure you have proper permissions for executing Ansible playbooks.
- Avoid storing plaintext passwords in `.ini` files.
- Use SSH keys for secure remote access.

## 🤝 Contributions
Contributions are welcome! Feel free to submit PRs or report issues in the [GitHub Repository](https://github.com/michaelbolanos/automate-ansible/issues).

## 📜 License
This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

---
Developed with ❤️ by **offthegridit**.

