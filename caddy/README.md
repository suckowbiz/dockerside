![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) [![](https://images.microbadger.com/badges/image/suckowbiz/caddy.svg)](https://microbadger.com/images/suckowbiz/caddy "Get your own image badge on microbadger.com")

# caddy

Caddy is the HTTP/2 web server with automatic HTTPS.

## Volumes

Caddy is configured with the Caddyfile. The Caddyfile is a text file that tells Caddy how to serve. CADDYPATH is used to store assets. Each instance of Caddy should have it's own CADDYPATH so that instances aren't stepping on each other and sharing state.

- `<current working directory>/Caddyfile` as Caddyfile
- `<current working directory>/.caddyfile`as CADDYPATH

## Ports

`2015` is exposed as the default port.

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `caddy` command available:

```bash
sudo curl --fail --location --show-error https://raw.githubusercontent.com/suckowbiz/dockerside/master/caddy/caddy -o /usr/local/bin/caddy && sudo chmod +x /usr/local/bin/caddy
```
