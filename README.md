# dockerside

Dock(er)side is a place to group Dockerfiles. It contains Ubuntu based Dockerfiles to run software I use(d).

## Dockerfiles

- Ansible automation tool [./ansible](./ansible) 
- Caddy web server [./caddy](./caddy)
- Google Chome web browser [./chrome](./chrome)
- chromix (chrome with citrix) [./chromix](./chromix)
- Clementine music player [./clementine](./clementine)
- VS Code IDE [./code](./code)
- Gimp image manipulation program [./gimp](./gimp)
- Goland GO IDE [./goland](./goland)
- KeePass2 password safe [./keepass2](./keepass2)
- Logster log producing app [./logster](./logster)
- NGINX web server [./nginx](./nginx)
- SuperTux 2D jump'n run [./supertux](./supertux)
- Tor Proxy [./tor](./tor)
- Unifi Network Management Controller [./unifi](./unifi)

Since persistence or system resources are involved almost all of the Dockerfiles come with their own run scripts (named after the service).

## Run

I built Dockerimages from most of the Dockerfiles and made them available on my account at quay.io [https://quay.io/user/suckowbiz](https://quay.io/user/suckowbiz).

## License

Licensed under MIT to allow doing anything with proper attribution and without warranty.

## Code Conventions

- Shell <https://google.github.io/styleguide/shell.xml>
- Docker <https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/>
