# gimp
Gimp image editor (with Photoshop look and feel).

## Volumes

- `~/Pictures` to load and persist image files
- TODO: Unfortunately gimp mixes system files and config. By now the gimp container is stateless.

## Run

Download run script to have `gimp` available:
 
```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/gimp/gimp > /var/tmp/gimp && sudo mv /var/tmp/gimp /usr/local/bin/ && sudo chmod +x /usr/local/bin/gimp
```
