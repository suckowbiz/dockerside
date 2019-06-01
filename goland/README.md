![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/goland.svg)

# goland

[Jet Brains Goland IDE](https://www.jetbrains.com/go/) baked together with Go development related dependencies.

<img src="https://www.jetbrains.com/go/img/screenshots/go_overview.png" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `goland` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/goland/goland \
  > /var/tmp/goland

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/goland /usr/local/bin/
sudo chmod +x /usr/local/bin/goland

# Execute the start script to run GoLand.
goland
```
