# gimp
Gimp image editor (with Photoshop look and feel).

# Mounts
- `~/Pictures` to load and persist image files
- TODO: Unfortunately gimp mixes system files and config. By now the gimp container is stateless.

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
Download and execute:
 
```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/gimp/gimp > /usr/bin/gimp && sudo chmod +x /usr/bin/gimp
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build gimp`.
- `dockerside/gimp/gimp`.
