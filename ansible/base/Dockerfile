FROM suckowbiz/base

LABEL maintainer="Tobias Suckow <tobias@suckow.biz>"

RUN apt-get update 
#RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get install --quiet --quiet --no-install-recommends \
    ansible \
    python3 \
    vim \
 && apt-get clean
