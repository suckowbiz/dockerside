# ansible-vault

Ansible vault executor.

# Volumes

- `<current working directory>` is assumed to contain the root of an ansible project to work with

## Run

Download run script to have `ansible-vault` available:

```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/vault/ansible-vault > /var/tmp/ansible-vault && sudo mv /var/tmp/ansible-vault /usr/local/bin/ && sudo chmod +x /usr/local/bin/ansible-vault
```
### Usage Example

```bash
ansible-vault --version
```
