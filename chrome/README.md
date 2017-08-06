# chrome
Google Chrome browser.

# Mounts
- `~/Downloads` to persist downloaded files
- `~/.config/google-chrome` to persist settings

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
Download and execute:
 
```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/chrome/chrome > /usr/bin/chrome && sudo chmod +x /usr/bin/chrome
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build chrome`.
- `dockerside/chrome/chrome`.