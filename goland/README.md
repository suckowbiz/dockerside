# goland

[Jet Brains Goland IDE](https://www.jetbrains.com/go/) baked together with Go development related dependencies.

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
