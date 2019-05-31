# supertux

[SuperTux](https://supertuxproject.org/), the free classic 2D jump'n run sidescroller game.

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