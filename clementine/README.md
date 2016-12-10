# clementine
Clementine free audio player.

# Mounts
- `~/Music` to persist/ load Music files
- `~/.config/Clementine` to persist settings.

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/clementine/clementine

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build clementine`.
- `dockerside/clementine/clementine`.