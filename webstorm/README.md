# webstorm

[Jet Brains WebStorm IDE](https://www.jetbrains.com/webstorm/) version baked together with development related dependencies such as nodejs and npm.

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `webstorm` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/webstorm/webstorm \
  > /var/tmp/webstorm

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/webstorm /usr/local/bin/
sudo chmod +x /usr/local/bin/webstorm

# Execute the start script to run webstorm.
webstorm
```