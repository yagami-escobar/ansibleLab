#! /bin/bash

# Genera key ssh si no existen
if [ ! -f ~/.ssh/id_rsa ]; then
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

# Wait ready Nodes
sleep 5

# Exec playbook
# ansible-playbook -i inventory/hosts.ini playbooks/setup-ssh.yml

# Keep live container
tail -f /dev/null