![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/chrome.svg)

# chrome

Google Chrome browser.

<img src="https://www.google.com/chrome/static/images/benefits/module-4/connected_global_desktop-2x.png" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Run

Download run script to have `chrome` available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/chrome/chrome \
  > /var/tmp/chrome

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/chrome /usr/local/bin/
sudo chmod +x /usr/local/bin/chrome

# Execute the start script to run chrome.
chrome
```