# keepass2
KeePass2, the free, open source, light-weight and easy-to-use password manager.

# Mounts
- `~/KeePass` to load Database files
- `~/.config/KeePass` to persist settings.

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/keepass2/keepass2

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build keepass2`.
- `dockerside/keepass2/keepass2`.