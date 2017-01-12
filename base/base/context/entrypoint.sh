#!/usr/bin/env bash
#
# Sets up a given user environment and starts the given application.
set -e

# Apply a user/group id that enables the given user being the owner of new files.
readonly NO_SUCH_GROUP_EXISTS=$(grep "^${GIVEN_GROUP}" /etc/group |grep ":${GIVEN_GROUP_ID}:"; echo $?)
if [[ "${NO_SUCH_GROUP_EXISTS}" = "1" ]]; then
    groupadd --gid "${GIVEN_GROUP_ID}" --non-unique "${GIVEN_GROUP}"
fi

readonly NO_SUCH_USER_EXISTS=$(grep "^${GIVEN_USER}" /etc/passwd |grep ":${GIVEN_USER_ID}:"; echo $?)
if [[ "${NO_SUCH_USER_EXISTS}" = "1" ]]; then
    useradd --create-home --non-unique --uid "${GIVEN_USER_ID}" --gid "${GIVEN_GROUP_ID}" "${GIVEN_USER}"
    if [[ -n "${ENTRYPOINT_GROUPS}" ]]; then
        usermod -a -G "${ENTRYPOINT_GROUPS}" "${GIVEN_USER}"
    fi
else
if [[ "${GIVEN_USER_ID}" = "0" ]]; then
        cp --recursive --no-dereference /etc/skel/. /root/
    fi
fi

if [[ ! "ENTRYPOINT_WORKDIR" = "" ]]; then
    cd "${ENTRYPOINT_WORKDIR}"
fi

# 'gosu' is used to run the executable on behalf of the just created user. (gosu has 1:1 parity with "docker --user")
# (idea.sh itself runs a foreground process utilizing 'exec')
if [[ "${ENTRYPOINT_AS_ROOT:=no}" = "yes" ]]; then
    gosu root "$@"
else
    gosu "${GIVEN_USER_ID}" "$@"
fi
