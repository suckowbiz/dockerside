![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) [![](https://images.microbadger.com/badges/image/suckowbiz/nginx.svg)](https://microbadger.com/images/suckowbiz/nginx "Get your own image badge on microbadger.com")

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
sudo curl --fail --location --show-error https://raw.githubusercontent.com/suckowbiz/dockerside/master/nginx/base/nginx -o /usr/local/bin/nginx && sudo chmod +x /usr/local/bin/nginx
```