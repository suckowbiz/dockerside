# ansible-vault
Ansible vault executor.

# Volumes
- `<current working directory>` is assumed to contain the root of an ansible project to work with

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
Download and execute:

```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/vault/ansible-vault > /usr/bin/ansible-vault && sudo chmod +x /usr/bin/ansible-vault
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build ansible-vault`.
- `dockerside/ansible/vault/ansible-vault`.