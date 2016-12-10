# git
Distributed version control system.

# Mounts
- `~/.config/git` to read/write global configuration
- `~/.ssh` to read SSH settings
- `<current working directory>` to mount as git repository

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/git/git

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build git`.
- `dockerside/git/git`.