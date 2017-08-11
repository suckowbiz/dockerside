# vscode

The vscode IDE.

## Volumes

- `<current working directory>` as code PATH
- `<home>/.gitconfig` as .gitconfig
- `<home>/.ssh` as .ssh
- `<home>/.config/vscode/extensions` as user extensions dir
- `<home>/.config/vscode/user-data` as user data dir
- `<home>/.local` to persist other settings


## Run

Download run script to have `code` available:
 
```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/vscode/code > /var/tmp/code && sudo mv /var/tmp/code /usr/local/bin/ && sudo chmod +x /usr/local/bin/code
```