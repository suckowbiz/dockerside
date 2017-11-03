#!/usr/bin/env bash

for app in chrome code gimp gogland keepass2 nfs steam tor caddy clementine git idea supertux; do
  sudo ln --force --symbolic "${PWD}/${app}/${app}" "/usr/local/bin/${app}"
done

sudo ln --force --symbolic "${PWD}/ansible/control/ansible" "/usr/local/bin/ansible"
sudo ln --force --symbolic "${PWD}/ansible/playbook/ansible-playbook" "/usr/local/bin/ansible-playbook"
sudo ln --force --symbolic "${PWD}/ansible/vault/ansible-vault" "/usr/local/bin/ansible-vault"
