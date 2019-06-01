![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/nginx.svg)

# nginx

NGINX.

## Volumes

- `<current working directory>`as DOCUMENT_ROOT

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `nginx` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/nginx/base/nginx \
  > /var/tmp/nginx

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/nginx /usr/local/bin/
sudo chmod +x /usr/local/bin/nginx

# Execute the start script to run nginx.
nginx
```