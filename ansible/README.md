# ansible
This directory groups files to dockerize an Ansible Control Machine and an Ansible Managed Node.

The intention to create it was to test ansible locally.

# Volumes
- `<current working directory>` is assumed to contain the root of an Ansible project to work with

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/control/ansible

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build ansible`.
- `dockerside/ansible/control/ansible`.