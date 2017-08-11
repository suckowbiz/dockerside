# These instructions serve the purpose to run Intellij IDEA.
FROM suckowbiz/base-av

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

ENV IDEA_TARBALL="ideaIU-2017.2.1-no-jdk.tar.gz" \
    JAVA_HOME="/etc/alternatives/java" \
    M2_HOME=/usr/local/maven \
    MAVEN_OPTS="-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dmaven.wagon.http.ssl.allowall=true" \
    MAVEN_VERSION=3.5.0 \
    PATH="${PATH}:/usr/local/maven/bin:/usr/local/idea/bin"

RUN apt-get update --quiet \
 && apt-get install --auto-remove --assume-yes --no-install-recommends  --quiet \
    git \
    firefox \
    make \
    openjdk-8-* \
    openjfx \
    libappindicator1 \
    libcurl3 \
    libxss1 \
    man \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local
# Download maven to install it.
RUN curl \
        --fail \
        --location \
        --remote-name \
        --show-error \
        https://www.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz{,.asc} \
 && gpg --keyserver "${KEY_SERVER}" --recv-keys B620D787 \
 && gpg --verify apache-maven-${MAVEN_VERSION}-bin.tar.gz.asc apache-maven-${MAVEN_VERSION}-bin.tar.gz \
 && tar -xf apache-maven-${MAVEN_VERSION}-bin.tar.gz \
 && rm --force apache-maven-${MAVEN_VERSION}-bin.tar.gz apache-maven-${MAVEN_VERSION}-bin.tar.gz.asc \
 && mv apache-maven-${MAVEN_VERSION} maven \
 && ln --symbolic /usr/local/maven /usr/share/

# Install and set up IDEA to have the binary in place for execution.
RUN curl \
        --fail \
        --location \
        --remote-name \
        --show-error \
        https://download.jetbrains.com/idea/${IDEA_TARBALL}{,.sha256} \
 && sha256sum --check ${IDEA_TARBALL}.sha256 || false \
 && tar --extract --file ${IDEA_TARBALL} \
 && rm --force --recursive ${IDEA_TARBALL} ${IDEA_TARBALL}.sha256 \
 && mv idea* idea \
 && sed --in-place "/MaxPermSize/d" idea/bin/idea64.vmoptions \
 && sed --in-place "s/.*idea.config.path=.*/idea.config.path=\~\/.IntelliJIdea\/config\//" /usr/local/idea/bin/idea.properties \
 && sed --in-place "s/.*idea.system.path=.*/idea.system.path=\~\/.IntelliJIdea\/system\//" /usr/local/idea/bin/idea.properties \
 # https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
 && echo "fs.inotify.max_user_watches = 524288" > /etc/sysctl.d/60-max_user_watches.conf \
 # Update SSL certificate cache to fix: java.security.InvalidAlgorithmParameterException: the trustAnchors parameter must be non-empty.
 && update-ca-certificates --fresh

VOLUME ["/opt/.gitconfig", "/opt/.IntelliJIdea", "/opt/.java", "/opt/.m2", "/opt/.ssh", "/opt/IdeaProjects"]

WORKDIR /etc/skel
RUN ln --symbolic /opt/.gitconfig \
 && ln --symbolic /opt/.IntelliJIdea \
 && ln --symbolic /opt/.java \
 && ln --symbolic /opt/.m2 \
 && ln --symbolic /opt/.ssh \
 && ln --symbolic /opt/IdeaProjects

ENTRYPOINT ["/entrypoint.sh", "idea.sh"]
