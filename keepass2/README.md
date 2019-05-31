# keepass2

KeePass2, the free, open source, light-weight and easy-to-use password manager.

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `keepass2` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/keepass2/keepass2 \
  > /var/tmp/keepass2

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/keepass2 /usr/local/bin/
sudo chmod +x /usr/local/bin/keepass2

# Execute the start script to run keepass2.
keepass2
```