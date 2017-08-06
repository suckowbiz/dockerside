# dockerside

Dock(er)side is a place to group Dockerfiles. It contains Ubuntu based Dockerfiles to run software I use(d).

## Requirements

- docker
- docker compose

## Build

Run `docker-compose build` or `docker-compose build <service>` from repository root to build the Docker Image(s). (Parts of the required `docker-compose.yaml` file are disabled since e.g. IntelliJ Idea or SPSS binaries are not shipped with this repository for license/ legacy reason.)

Note: Some of these Images are available at <https://hub.docker.com/u/suckowbiz/>.

## Run

Since persistence or system resources are involved almost all of the Dockerfiles come with their own run scripts (named after the service). See subdirectories.

## Notes

1. This stuff is licensed under MIT to allow doing anything with proper attribution and without warranty.
1. Applied Conventions:
- Shell <https://google.github.io/styleguide/shell.xml>
- Docker <https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/>