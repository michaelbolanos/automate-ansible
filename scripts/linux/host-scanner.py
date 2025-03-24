#!/usr/bin/env python3
# host_scanner.py
import subprocess
import yaml
import os

def load_inventory(path):
    with open(path, 'r') as file:
        inventory = yaml.safe_load(file)
    return inventory

def extract_hosts(inventory):
    hosts = []
    for group in inventory.values():
        if isinstance(group, dict) and 'hosts' in group:
            hosts.extend(group['hosts'].keys())
    return hosts

def ping_host(host):
    try:
        output = subprocess.run(["ping", "-c", "1", "-W", "1", host],
                                stdout=subprocess.DEVNULL)
        return output.returncode == 0
    except Exception:
        return False

def main():
    inventory_path = os.path.expanduser("~/scripts/automate-ansible/inventory/inventory.yml")
#    inventory_path = "~/scripts/automate-ansible/inventory/inventory.yml"
    if not os.path.exists(inventory_path):
        print("Inventory file not found at", inventory_path)
        return

    print("Loading inventory...")
    inventory = load_inventory(inventory_path)
    hosts = extract_hosts(inventory)

    print(f"\nChecking {len(hosts)} host(s):\n")
    for host in hosts:
        status = "UP" if ping_host(host) else "DOWN"
        print(f"{host:20} - {status}")

if __name__ == "__main__":
    main()
