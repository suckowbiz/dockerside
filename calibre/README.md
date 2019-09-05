![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/calibre.svg)

# calibre

Calibre is a powerful and easy to use e-book manager.

<img src="https://lh5.ggpht.com/_lG58t3XWd3c/SwtE6JlJbgI/AAAAAAAAACA/bJ1m3pH8dLA/s800/stanza_and_calibre.png" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Run

Download run script to have `calibre` available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/calibre/calibre \
  > /var/tmp/calibre

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/calibre /usr/local/bin/
sudo chmod +x /usr/local/bin/calibre

# Execute the start script to run calibre.
calibre
```