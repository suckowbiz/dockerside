FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu eoan main" >> /etc/apt/sources.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-key 93C4A3FD7BB9C367
RUN apt-get update \
 && apt-get install --quiet --quiet --no-install-recommends \
    ansible \
    python3 \
    python3-pip \
    python3-setuptools \
    vim

RUN pip3 install mock kubernetes openshift
