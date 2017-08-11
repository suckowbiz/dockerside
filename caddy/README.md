# caddy

The caddy webserver.

## Volumes

- `<current working directory>/Caddyfile`as Caddyfile
- `<current working directory>/.caddyfile`as CADDYPATH

## Ports

- 2015 to expose the default port

## Run

Download run script to have `caddy` available:
 
```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/caddy/caddy > /var/tmp/caddy && sudo mv /var/tmp/caddy /usr/local/bin/ && sudo chmod +x /usr/local/bin/caddy
```
