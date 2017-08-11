# ansible-playbook

Ansible Playbook executor.

# Volumes

- `<current working directory>` is assumed to contain the root of an ansible project to work with

## Run

Download run script to have `ansible-playbook` available:

```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/playbook/ansible-playbook > /var/tmp/ansible-playbook && sudo mv /var/tmp/ansible-playbook /usr/local/bin/ && sudo chmod +x /usr/local/bin/ansible-playbook
```

### Usage Example

```bash
ansible-playbook --version
```
