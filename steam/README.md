# steam
Dockerized [steam](steampowered.com) installation (considers Intel Graphics only).

# Mounts
- `~/.steam` to persist steam files

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/steam/steam

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build steam`.
- `dockerside/steam/steam`.
