# steam

Dockerized [steam](steampowered.com) installation (considers Intel Graphics only).

## Volumes

- `~/.steam` to persist steam files

## Run

Download run script to have `steam` available:
 
```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/steam/steam > /var/tmp/steam && sudo mv /var/tmp/steam /usr/local/bin/ && sudo chmod +x /usr/local/bin/steam
```