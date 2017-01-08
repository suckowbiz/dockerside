# nginx
NGINX.

# Mounts
- `<current working directory>`as DOCUMENT_ROOT

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/nginx/nginx

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build nginx`.
- `dockerside/nginx/nginx`.