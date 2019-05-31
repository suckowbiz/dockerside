# caddy

Caddy is the HTTP/2 web server with automatic HTTPS.

## Volumes

Caddy is configured with the Caddyfile. The Caddyfile is a text file that tells Caddy how to serve. CADDYPATH is used to store assets. Each instance of Caddy should have it's own CADDYPATH so that instances aren't stepping on each other and sharing state.

- `<current working directory>/Caddyfile` as Caddyfile
- `<current working directory>/.caddyfile`as CADDYPATH

## Ports

`2015` is exposed as the default port.

## Getting Started

Download run script to have `caddy` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/caddy/caddy \
  > /var/tmp/caddy

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/caddy /usr/local/bin/
sudo chmod +x /usr/local/bin/caddy

# Execute the start script to run caddy.
caddy
```
