#!/bin/bash

# Define script directories
USER_SCRIPT_DIR="$HOME/otg"
GLOBAL_SCRIPT_DIR="/otg"
ANSIBLE_HOSTS_FILE="/etc/ansible/hosts"

# Function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Ensure required packages are installed
MISSING_PKGS=""
for cmd in whiptail asciiquarium cmatrix neofetch nano ansible-playbook sudo grep wg curl; do
    if ! command_exists "$cmd"; then
        MISSING_PKGS+="$cmd "
    fi
done

if [ -n "$MISSING_PKGS" ]; then
    echo -e "\e[31mMissing required packages: $MISSING_PKGS\e[0m"
    echo "Please install them first (e.g., sudo apt install $MISSING_PKGS)."
    exit 1
fi

# Set whiptail background color to green
export NEWT_COLORS='
    root=green,black
    window=green,black
    border=green,black
    textbox=green,black
    button=black,green
    entry=black,green
'

# Main interactive menu
while true; do
    CHOICE=$(whiptail --title "Welcome to offthegridit" --menu "Select an option:" 20 70 14 \
        "1" "Exit to terminal" \
        "2" "Show system info" \
        "3" "Check WAN & Network" \
        "4" "Open text editor" \
        "5" "Reboot system" \
        "6" "Run Ansible Playbook (Normal)" \
        "7" "Run Ansible Playbook (Prompt SSH Password)" \
        "8" "View Ansible Hosts" \
        "9" "Edit Ansible Inventory Files" \
        "10" "Check for passwords in .ini files" \
        "11" "Check & Connect to WireGuard" \
        "12" "Disconnect from WireGuard" \
        "13" "Show active WireGuard connections" \
        "14" "Run Matrix Screensaver" \
        "15" "Open Bash shell" 3>&1 1>&2 2>&3)

    case $CHOICE in
        1) break ;;  # Exit to terminal
        2)  
            clear
            echo "===== System Information ====="
            neofetch --stdout | tee /dev/tty | less
            read -p "Press Enter to continue..."
            ;;
        3)  
            WAN_IP=$(curl -s ifconfig.me || echo "Unknown")
            NETWORK_STATUS=$(ping -c 5 8.8.8.8 2>&1)
            whiptail --title "Network & WAN Status" --msgbox "WAN IP: $WAN_IP\n\nNetwork Test:\n$NETWORK_STATUS" 15 80
            ;;
        4) nano ;;
        5) sudo reboot ;;
        6|7)  
            PLAYBOOKS=()
            while IFS= read -r file; do
                PLAYBOOKS+=("$file")
            done < <(find "$USER_SCRIPT_DIR" "$GLOBAL_SCRIPT_DIR" -type f \( -name "*.yml" -o -name "*.yaml" \) 2>/dev/null)

            if [ ${#PLAYBOOKS[@]} -eq 0 ]; then
                whiptail --title "Run Ansible Playbook" --msgbox "No playbooks found." 10 60
                continue
            fi

            MENU_OPTIONS=()
            for i in "${!PLAYBOOKS[@]}"; do
                MENU_OPTIONS+=("$i" "$(basename "${PLAYBOOKS[$i]}")")
            done
            PLAYBOOK_CHOICE=$(whiptail --title "Run Ansible Playbook" --menu "Select a playbook to run:" 20 60 10 "${MENU_OPTIONS[@]}" 3>&1 1>&2 2>&3)

            if [[ -n "$PLAYBOOK_CHOICE" ]]; then
                SELECTED_PLAYBOOK="${PLAYBOOKS[$PLAYBOOK_CHOICE]}"
                if [ "$CHOICE" == "6" ]; then
                    ansible-playbook "$SELECTED_PLAYBOOK"
                else
                    ansible-playbook -k "$SELECTED_PLAYBOOK"
                fi
                whiptail --title "Playbook Execution" --msgbox "Playbook $SELECTED_PLAYBOOK has finished running." 10 60
            fi
            ;;
        9)  
            INVENTORY_FILES=()
            while IFS= read -r file; do
                INVENTORY_FILES+=("$file")
            done < <(find "$USER_SCRIPT_DIR" "$GLOBAL_SCRIPT_DIR" -type f \( -name "inventory*" -o -name "hosts*" -o -name "*.ini" \) 2>/dev/null)

            if [ ${#INVENTORY_FILES[@]} -eq 0 ]; then
                whiptail --title "Edit Ansible Inventory" --msgbox "No inventory files found." 10 60
                continue
            fi

            MENU_OPTIONS=()
            for i in "${!INVENTORY_FILES[@]}"; do
                MENU_OPTIONS+=("$i" "${INVENTORY_FILES[$i]}")
            done
            INVENTORY_CHOICE=$(whiptail --title "Edit Ansible Inventory" --menu "Select an inventory file to edit:" 20 60 10 "${MENU_OPTIONS[@]}" 3>&1 1>&2 2>&3)

            if [[ -n "$INVENTORY_CHOICE" ]]; then
                sudo nano "${INVENTORY_FILES[$INVENTORY_CHOICE]}"
            fi
            ;;
        11)  
            WG_STATUS=$(sudo wg show 2>/dev/null)
            if [ -n "$WG_STATUS" ]; then
                whiptail --title "WireGuard Status" --msgbox "WireGuard is connected:\n\n$WG_STATUS" 15 80
            else
                WG_CONFIGS=($(ls /etc/wireguard/*.conf 2>/dev/null))
                if [ ${#WG_CONFIGS[@]} -eq 0 ]; then
                    whiptail --title "WireGuard" --msgbox "No WireGuard configurations found." 10 60
                    continue
                fi

                MENU_OPTIONS=()
                for i in "${!WG_CONFIGS[@]}"; do
                    MENU_OPTIONS+=("$i" "$(basename "${WG_CONFIGS[$i]}")")
                done
                WG_CHOICE=$(whiptail --title "Connect to WireGuard" --menu "Select a WireGuard configuration to connect:" 20 60 10 "${MENU_OPTIONS[@]}" 3>&1 1>&2 2>&3)

                if [[ -n "$WG_CHOICE" ]]; then
                    sudo wg-quick up "$(basename "${WG_CONFIGS[$WG_CHOICE]}" .conf)"
                    whiptail --title "WireGuard" --msgbox "WireGuard connected successfully." 10 60
                fi
            fi
            ;;
        12) sudo wg-quick down "$(sudo wg show | grep interface | awk '{print $2}')" ;;
        13) whiptail --title "Active WireGuard Connections" --msgbox "$(sudo wg show 2>/dev/null || echo 'No active WireGuard connections.')" 15 80 ;;
        14)  
            clear
            echo "Press [CTRL+C] to exit the Matrix Screensaver"
            sleep 2
            cmatrix -C green -abs
            ;;
        15) bash ;;  # Open Bash shell (moved to last)
        *) echo "Invalid option. Please try again." ;;
    esac
done
