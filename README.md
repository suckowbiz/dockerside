# dockerside
Dock(er)side is a place to group Dockerfiles.

# Story
For different reasons I decided to get rid of local application installation(s) 
and instead dockerize the apps I (temporarily) use on my Ubuntu machine.

For details see `README.md` in particular subdirectories.

# Why?
Some of the applications I dockerized are available on public repositories 
but usually their authors do not care much about file permissions and/or 
security. My requirements are:
- Files created by containers must be owned by the current OS user
- Availability of Ubuntu based run scripts for simplicity
- Quality

# Build the Docker Image(s)
Run `docker-compose build` or `docker-compose build <service>` from 
repository root to build image(s). (Parts of the required `docker-compose.yaml` 
file are disabled since e.g. IntelliJ Idea or SPSS binaries are not 
shipped with this repository for license/ legacy reason.) 

Some of these images are available at (hub.docker.com)[https://hub.docker.com/u/suckowbiz/]. 

# Run a Docker Container
Since persistence or system resources are involved almost all of the Dockerfiles 
come with their own runscripts (named after the service).   

E.g. for *gimp* it is `./gimp/gimp`. Run it to execute gimp and auto-mount your local `~/Picutures` folder.

# Requirements
- docker
- docker compose

# Notes
 1. This stuff is licensed under MIT to allow doing anything with proper attribution and without warranty.
 2. Applied Conventions:
   - Shell https://google.github.io/styleguide/shell.xml
   - Docker https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/