#! /usr/bin/bash

cd ansible

echo "Running homelab Ansible host updates"

if ! tailscale status > /dev/null; then
	echo "Starting tailscale"
	tailscale up
	tailscale switch headscale.simsine.no
fi

ansible-playbook update_hosts.yml --become-password-file .ansible_sudo_password --vault-password-file .ansible_vault_key --verbose
