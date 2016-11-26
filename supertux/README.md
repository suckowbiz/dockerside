# supertux
[SuperTux](https://supertuxproject.org/), the free classic 2D jump'n run sidescroller game.

# Mounts
- `~/.local/share/supertux2` to persist SuperTux user data.

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/supertux/supertux

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build supertux`.
- `dockerside/supertux/supertux`.