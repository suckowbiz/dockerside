# ansible
An Ansible Control Machine.

# Volumes
- `<current working directory>` is assumed to contain the root of an ansible project to work with

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute:

```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/ansible/control/ansible > /usr/bin/ansible && sudo chmod +x /usr/bin/ansible
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build ansible`.
- `dockerside/ansible/control/ansible`.