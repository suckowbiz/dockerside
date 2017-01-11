# caddy
The caddy webserver.

# Mounts
- `<current working directory>/Caddyfile`as Caddyfile
- `<current working directory>/.caddyfile`as CADDYPATH

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/caddy/caddy

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build caddy`.
- `dockerside/caddy/caddy`.
