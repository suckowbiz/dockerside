![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/unifi.svg)

# unifi

Ubiquity UniFi Network Management Controller [https://www.ui.com/software/](https://www.ui.com/software/).

<img src="https://prd-www-cdn.ubnt.com/media/images/dashboard/frames/unifi-image@2x.png" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Run

Download run script to have `unifi` available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/unifi/unifi \
  > /var/tmp/unifi

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/unifi /usr/local/bin/
sudo chmod +x /usr/local/bin/unifi

# Execute the start script to run unifi.
unifi
```







