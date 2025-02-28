# 🚀 Automate Ansible

<p align="center">
  <img src="https://offthegridit.com/wp-content/uploads/2024/05/offthergridit-logo-tree1.jpg" alt="offthegridit logo" width="120">
</p>

> **Automation for Computers**  
> Mac  
> Windows  
> Linux  

---

## 🤖 Why Use Automate Ansible?

### 🔹 **For IT System Administration Practitioners: Automate, Standardize, and Scale**  
Managing IT environments across **Windows, Mac, and Linux** can be time-consuming and prone to errors. **Automate Ansible** provides a structured, efficient way to streamline system administration by:

- **Standardizing Deployments**: Ensure consistency across multiple machines with repeatable, automated playbooks.  
- **Saving Time & Reducing Errors**: Automate repetitive tasks like patching, software installations, and configuration changes, reducing human error and improving efficiency.  
- **Remote Management & Compliance**: Apply security policies, enforce configurations, and monitor systems without manual intervention, ensuring systems stay secure and up to date.  
- **Optimizing IT Operations**: Free up valuable time by automating routine maintenance, allowing admins to focus on more strategic projects.  

With **Automate Ansible**, system administrators can **reduce complexity, enhance reliability, and simplify daily IT operations**.  

---

### 🔹 **For IT Learners: Hands-on Experience in Automation & DevOps**  
If you're learning **IT support, system administration, or automation**, this project gives you **real-world, practical experience** with:

- **Ansible Basics**: Learn how to write and execute playbooks to automate IT tasks.  
- **Cross-Platform Automation**: Gain experience managing **Mac, Windows, and Linux** environments.  
- **Infrastructure as Code (IaC)**: Understand best practices for configuration management and automation.  
- **Job-Ready Skills**: Automation is a key skill in modern IT roles. Whether you're pursuing **sysadmin, DevOps, or cloud engineering**, Ansible knowledge gives you an edge.  

This tool is more than just a learning resource—it’s a **practical automation solution** for everyday IT administration.  

---

## ✨ Capabilities

- ✅ Useful - Designed to streamline complex administrative tasks, reducing manual effort and increasing efficiency.
- 🚀 Simple - Easy-to-use automation with intuitive commands and well-structured playbooks for rapid deployment.
- 🛠️ Thorough - Covers a wide range of system administration needs, from configuration management to software deployment.
- 🌍 Cross-Platform: Works seamlessly across Windows, Mac, and Linux.
- 🔄 Scalable Automation: Run automated tasks on multiple machines efficiently.

---
## 📚 Prerequisites Knowledge

Before using **Automate Ansible**, aspiring system administrators should have basic knowledge of the following:

### 🔹 Windows
- **Command Line (CMD & PowerShell)**: Understanding how to navigate directories, execute commands, and manage files.
  - Learn more: [Microsoft Docs](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
- **Windows Management Instrumentation (WMI) & WinRM**: Essential for remote system administration.
  - Learn more: [Microsoft WMI Documentation](https://learn.microsoft.com/en-us/windows/win32/wmisdk/wmi-start-page)

### 🔹 macOS
- **Terminal & Bash/Zsh**: Understanding shell commands and scripting.
  - Learn more: [Apple Developer Shell Guide](https://developer.apple.com/library/archive/documentation/OpenSource/Conceptual/ShellScripting/Introduction/Introduction.html)
- **Homebrew**: A package manager for installing software and dependencies.
  - Learn more: [Homebrew](https://brew.sh/)

### 🔹 Linux
- **File System & Permissions**: Understanding `ls`, `chmod`, `chown`, `mkdir`, etc.
  - Learn more: [Linux File System Basics](https://www.tldp.org/LDP/intro-linux/html/sect_03_01.html)
- **Package Management**: Using `apt`, `yum`, `dnf`, or `pacman` for software installation.
  - Learn more: [Linux Package Management](https://linuxize.com/post/how-to-use-apt-command/)
- **SSH & Remote Access**: Securely accessing remote systems via SSH.
  - Learn more: [SSH Guide](https://www.ssh.com/academy/ssh)

---
## 🛠 Prerequisites for Control Node

Before installing and using **Automate Ansible**, ensure you have the following dependencies set up for your control node:

### Required Dependencies
- **curl**
- **wget** (already installed on most systems)
- **git** (already installed on most systems)
- **python3**
- **nmap**
- **gh** (GitHub CLI)

### 🔹 Windows
- Install **Windows Subsystem for Linux (WSL)** or use a Linux VM.
- Install **Python** and **pip**.
- Install **Ansible** via WSL or Cygwin.

### 🔹 macOS
- Install **Homebrew** (if not already installed):
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Install dependencies:
  ```bash
  brew install python ansible curl nmap gh
  ```

### 🔹 Linux
- Ensure required packages are installed:
  ```bash
  sudo apt update && sudo apt install -y python3 python3-pip curl wget nmap gh
  ```
- Install **Ansible**:
  ```bash
  pip3 install ansible
  ```

---
## 🛠 Target Hosts & Dependencies

Each target system should have the following dependencies installed to be managed effectively:

### 🔹 Windows
- **WinRM enabled** (for remote administration)
- **Python (optional, required for some scripts)**

### 🔹 macOS
- **Homebrew installed**
- **Python installed**
- **SSH enabled**

### 🔹 Linux
- **Python installed**
- **SSH enabled**
- **Required dependencies installed via package manager**

---

## 📺 Screenshot

Coming soon

---


## 🛠 Installation & Usage

Coming Soon

## 🎬 Stupid Demo Video

[![Watch the video](https://img.youtube.com/vi/reAXSyYBFM4/maxresdefault.jpg)](https://www.youtube.com/watch?v=reAXSyYBFM4)

---

# automate-ansible

## Directory Structure

```bash
/automate-ansible
│── README.md                 # Main Overview
│── docs/
│   ├── windows.md            # Windows-specific setup
│   ├── mac.md                # macOS-specific setup
│   ├── linux.md              # Linux-specific setup
│   ├── prerequisites.md      # General Prerequisites
│   ├── target-hosts.md       # Target Hosts & Dependencies
│   ├── installation.md       # Installation Guide
│   ├── usage.md              # Usage & Commands
│   ├── faq.md                # Frequently Asked Questions
```

## Documentation Overview
- **[Windows Setup](docs/windows.md)** – Steps to configure Windows machines.
- **[macOS Setup](docs/mac.md)** – Guide for setting up Ansible on macOS.
- **[Linux Setup](docs/linux.md)** – Instructions for Linux installations.
- **[General Prerequisites](docs/prerequisites.md)** – Requirements before starting.
- **[Target Hosts & Dependencies](docs/target-hosts.md)** – Information on configuring target machines.
- **[Installation Guide](docs/installation.md)** – How to install and configure Ansible.
- **[Usage & Commands](docs/usage.md)** – Examples and commands for usage.
- **[Frequently Asked Questions](docs/faq.md)** – Common issues and solutions.

## Getting Started
Follow the [Installation Guide](docs/installation.md) to set up Ansible for your environment.

## Contributing
Feel free to contribute by opening issues or submitting pull requests.

## License
This project is licensed under the MIT License.


### 🔹 Clone this repository:
```bash
git clone https://github.com/michaelbolanos/automate-ansible.git
cd automate-ansible
```

