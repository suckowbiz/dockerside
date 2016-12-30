# ansible-node
An Ansible Managed (test) Node just providing SSH access for root user: ***ansible*** (password: ansible).

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

# Ports
- 8022 (SSH access)

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/node/ansible-node

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build ansible-node`.
- `dockerside/ansible/node/ansible-node`.