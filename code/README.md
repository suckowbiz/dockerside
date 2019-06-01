![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/code.svg)

# vscode

The Visual Studio Code IDE.

<img src="https://code.visualstudio.com/opengraphimg/opengraph-home.png" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `code` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/code/code \
  > /var/tmp/code

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/code /usr/local/bin/
sudo chmod +x /usr/local/bin/code

# Execute the start script to run code.
code
```