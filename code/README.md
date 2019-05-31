# vscode

The Visual Studio Code IDE.

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