FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update \
 && apt-get install --quiet --quiet --no-install-recommends \
    ansible \
    python \
    vim
