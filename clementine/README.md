# clementine

Clementine free audio player.

<img src="https://clementine-player.github.io/pages/images/screenshots/clementine-1.2-1.png" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `clementine` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/clementine/clementine \
  > /var/tmp/clementine

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/clementine /usr/local/bin/
sudo chmod +x /usr/local/bin/clementine

# Execute the start script to run clementine.
clementine
```