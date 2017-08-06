# vscode
The vscode IDE.

# Mounts
- `<current working directory>` as code PATH
- `<home>/.gitconfig` as .gitconfig
- `<home>/.ssh` as .ssh
- `<home>/.config/vscode/extensions` as user extensions dir
- `<home>/.config/vscode/user-data` as user data dir
- `<home>/.local` to persist other settings

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

## Using public image from Docker registry
Download and execute:
 
```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/vscode/code > /usr/bin/code && sudo chmod +x /usr/bin/code
```

## (Build from scratch) 
- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build vscode`.
- `dockerside/vscode/code`.
