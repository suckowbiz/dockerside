# nginx
NGINX.

## Volumes

- `<current working directory>`as DOCUMENT_ROOT

## Run

Download run script to have `nginx` available:
 
```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/nginx/base/nginx > /var/tmp/nginx && sudo mv /var/tmp/nginx /usr/local/bin/ && sudo chmod +x /usr/local/bin/nginx
```