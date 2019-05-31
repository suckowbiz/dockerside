# nginx-php

NGINX with PHP 7 support.

# Requirements

- Docker Runtime
- Ubuntu Operating System

## Getting Started

Download run script to have `nginx-php` command available:

```bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/suckowbiz/dockerside/master/nginx/php/nginx-php \
  > /var/tmp/nginx-php

# Move the download script and add add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/nginx-php /usr/local/bin/
sudo chmod +x /usr/local/bin/nginx-php

# Execute the start script to run nginx-php.
nginx-php
```