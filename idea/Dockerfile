## These instructions serve the purpose to run Intellij IDEA.
FROM suckowbiz/base-av
MAINTAINER Tobias Suckow <tobias@suckow.biz>

ENV GRADLE_VERSION=2.14 \
    IDEA_TARBALL=idea.tar.gz \
    MAVEN_VERSION=3.3.9

# Install required dependencies to make the setup work.
RUN apt-get update --quiet \
 && apt-get install --quiet --yes \
    git \
    firefox \
    make \
    openjdk-8-* \
    openjfx \
    libappindicator1 \
    libcurl3 \
    libxss1 \
    nodejs \
    nodejs-legacy \
    npm \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
# Download latest maven version to install it and avoid all the issues with bundled maven version(s)
RUN curl -LOSs https://www.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.{gz,gz.asc} \
 && gpg --keyserver $KEY_SERVER --recv-keys BB617866 \
 && gpg --verify apache-maven-$MAVEN_VERSION-bin.tar.gz.asc apache-maven-$MAVEN_VERSION-bin.tar.gz \
 && tar -xf apache-maven-$MAVEN_VERSION-bin.tar.gz \
 && rm -f apache-maven-$MAVEN_VERSION-bin.tar.gz apache-maven-$MAVEN_VERSION-bin.tar.gz.asc \
 && mv apache-maven-$MAVEN_VERSION maven \
 && ln -s /opt/maven /usr/share/

RUN npm install -g bower

# Download Gradle to install it afterwards.
RUN curl -LOSs https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip \
 && unzip gradle-$GRADLE_VERSION-bin.zip \
 && rm -f gradle-$GRADLE_VERSION-bin.zip \
 && mv gradle* gradle 

# Install and set up IDEA to have the binary in place for execution.
# Update SSL certificate cache (fixes: java.security.InvalidAlgorithmParameterException: the trustAnchors parameter must be non-empty).
COPY $IDEA_TARBALL ./
RUN tar -axf $IDEA_TARBALL \
 && rm -rf $IDEA_TARBALL \
 && mv idea* idea \
 && sed -i "/MaxPermSize/d" idea/bin/idea64.vmoptions \
 && update-ca-certificates -f

# Download and install liquid prompt
RUN git clone https://github.com/nojhan/liquidprompt.git

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64" \
    MAVEN_OPTS="-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true -Dmaven.wagon.http.ssl.allowall=true" \
    M2_HOME=/opt/maven \
    GRADLE_HOME=/opt/gradle \
    PATH=/opt:/opt/maven/bin:/opt/idea/bin:/opt/gradle/bin:$PATH

# Add context to provide dependencies.
COPY context /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]
