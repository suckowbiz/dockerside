# idea
A [Dockerfile](http://docs.docker.com/engine/reference/builder/) to serve 
an [IntelliJ IDEA](https://www.jetbrains.com/idea/download/) installation 
baked together with all required dependencies such as a Browser (Firefox) 
and Tools/Runtime (Git, Gradle, Maven, Java, Bower) ...

# Mounts
- `~/IdeaProjects` to persist/ load workspace
- `~/.IntelliJIdea` to persist settings
- `/home/tobias/.m2` to persist Maven
- `/home/tobias/.ssh` to use local SSH configuration
- `/home/tobias/.gitconfig` to use local GIT configuration

# Run
...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:
- Clone (and change into): `git clone https://github.com/suckowbiz/dockerside.git && cd dockerside`
- [Download IntelliJ IDEA](https://www.jetbrains.com/idea/download/) and place it as `idea.tar.gz` within `./idea/` directory
- Enable the *idea* part in `dockerside/docker-compose.yaml` and run `docker-compose --file dockerside/docker-compose.yaml build idea`.
- Execute `dockerside/idea/idea`.

Notes:
- https://resources.jetbrains.com/assets/products/intellij-idea/IntelliJIDEA_ReferenceCard.pdf
- Since some of the Ubuntu key bindings overlap with Idea binding I decided to disable them automatically with the run script. If you like to restore execute `./edit-gnome-key-bindings.sh restore`.
