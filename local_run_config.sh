#! /usr/bin/bash

cd ansible

echo "Running homelab Ansible local test configuration"

if ! tailscale status > /dev/null; then
	echo "Starting tailscale"
	tailscale up
	tailscale switch headscale.simsine.no
fi

if [ -e local_config.yml ]
then
	ansible-playbook local_config.yml --become-password-file .ansible_sudo_password --vault-password-file .ansible_vault_key
else
	echo "No local config found please create it first."
fi
