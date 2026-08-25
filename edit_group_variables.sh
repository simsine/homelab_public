#! /usr/bin/bash

cd ansible

echo "Opening group vars in editor"

ansible-vault edit group_vars/all --vault-password-file .ansible_vault_key

if [ $? -ne 0 ]; then
	echo "Error in writing group vars file, have you created a vault password file?"
	exit 1
fi

echo "Wrote updated group vars file"
