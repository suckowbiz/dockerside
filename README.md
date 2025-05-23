# dockerside

![Docker Hub Publish](https://github.com/suckowbiz/dockerside/actions/workflows/build-and-push.yml/badge.svg?event=schedule)

Dock(er)side is a place to group Dockerfiles. It contains Ubuntu based Dockerfiles to run software I use(d).

## Dockerfiles

(Note: Dockerfiles such as Chrome, Chromix, SweetHome 3D, tor, VSCode have been removed.)

- Ansible automation tool [./ansible](./ansible)
- Clementine music player [./clementine](./clementine)
- Gimp image manipulation program [./gimp](./gimp)
- Goland GO IDE [./goland](./goland)
- Tor Proxy [./tor](./tor)

Since persistence or system resources are involved almost all of the Dockerfiles come with their own run scripts (named after the service).

## Run

I built Dockerimages from most of the Dockerfiles and made them available on my account at hub.docker.com [https://hub.docker.com/u/suckowbiz](https://hub.docker.com/u/suckowbiz).

## License

Licensed under MIT to allow doing anything with proper attribution and without warranty.

## Code Conventions

- Shell <https://google.github.io/styleguide/shell.xml>
- Docker <https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/>
