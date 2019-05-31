# chrome

Citrix Workspace-App running on Chrome.

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Run

Download run script to have `chromix` available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/chromix/chromix \
  > /var/tmp/chromix

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/chromix /usr/local/bin/
sudo chmod +x /usr/local/bin/chromix

# Execute the start script to run chromix.
chromix
```