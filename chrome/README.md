# chrome

Google Chrome browser.

## Volumes

- `~/Downloads` to persist downloaded files
- `~/.config/google-chrome` to persist settings

## Run

Download and execute:
 
```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/chrome/chrome > /var/tmp/chrome && sudo mv /var/tmp/chrome /usr/local/bin/ && sudo chmod +x /usr/local/bin/chrome
```