# keepass2
KeePass2, the free, open source, light-weight and easy-to-use password manager.

## Volumes

- `~/KeePass` to load Database files
- `~/.config/KeePass` to persist settings

## Run

Download run script to have `keepass2` available:
 
```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/keepass2/keepass2 > /var/tmp/keepass2 && sudo mv /var/tmp/keepass2 /usr/local/bin/ && sudo chmod +x /usr/local/bin/keepass2
```