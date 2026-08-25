#! /usr/bin/bash

cd ansible

echo "Installing Ansible dependencies"

ansible-galaxy install -r requirements.yml
