# ansible-playbook
Ansible Playbook executor.

# Volumes
- `<current working directory>` is assumed to contain the root of an ansible project to work with

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute:

```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/playbook/ansible-playbook > /usr/bin/ansible-playbook && sudo chmod +x /usr/bin/ansible-playbook
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build ansible-playbook`.
- `dockerside/ansible/playbook/ansible-playbook`.