# ansible-playbook
Ansible Playbook executor.

# Volumes
- `<current working directory>` is assumed to contain the root of an ansible project to work with

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/playbook/ansible-playbook

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build ansible-playbook`.
- `dockerside/ansible/playbook/ansible-playbook`.