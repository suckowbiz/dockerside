# gimp

Gimp image editor.

<img src="https://www.gimp.org/release-notes/images/2.10-update-ui.jpg" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `gimp` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/gimp/gimp \
  > /var/tmp/gimp

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/gimp /usr/local/bin/
sudo chmod +x /usr/local/bin/gimp

# Execute the start script to run gimp.
gimp
```