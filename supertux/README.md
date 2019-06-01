![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/suckowbiz/supertux.svg)

# supertux

[SuperTux](https://supertuxproject.org/), the free classic 2D jump'n run sidescroller game.

<img src="https://www.supertux.org/images/0_5_1/0_5_1_3.png" alt="screenshot" width="800" />

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `supertux` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/supertux/supertux \
  > /var/tmp/supertux

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/supertux /usr/local/bin/
sudo chmod +x /usr/local/bin/supertux

# Execute the start script to run supertux.
supertux
```