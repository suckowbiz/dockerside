# nginx-php
NGINX with PHP 7 support.

# Mounts
- `<current working directory>`as DOCUMENT_ROOT

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
Download and execute:

```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/nginx/php/nginx-php > /usr/bin/nginx-php && sudo chmod +x /usr/bin/nginx-php
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build nginx-php`.
- `dockerside/nginx/php/nginx-php`.
