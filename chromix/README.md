![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/chromix.svg)

# chrome

Citrix Workspace-App running on Chrome.

<img src="https://lh3.googleusercontent.com/HHS4rNTJA7YX7sIhkzs1gMkxcpxCTOiAvPLBKqB7RN42JeXWV3R7DZ583wbuflyGAEGUHrz8gA=w640-h400-e365" alt="screenshot" width="800" />

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