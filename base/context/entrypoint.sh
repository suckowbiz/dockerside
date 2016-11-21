#!/usr/bin/env bash
#
# Sets up a given user environment and starts the given application.
set -e

# Apply a user/group id that enables the given user being the owner of new files.
readonly GROUP_MATCHES_EXACTLY=$(grep "^${GIVEN_GROUP}" /etc/group |grep ":${GIVEN_GROUP_ID}:"; echo $?)
if [ "${GROUP_MATCHES_EXACTLY}" = "1" ]
then
  echo "Adding group: ${GIVEN_GROUP} (${GIVEN_GROUP_ID})..."
  groupadd --gid "${GIVEN_GROUP_ID}" --non-unique "${GIVEN_GROUP}"
fi

readonly USER_MATCHES_EXACTLY=$(grep "^${GIVEN_USER}" /etc/passwd |grep ":${GIVEN_USER_ID}:"; echo $?)
if [ "${USER_MATCHES_EXACTLY}" = "1" ]
then
  echo "Adding user: ${GIVEN_USER}(${GIVEN_USER_ID}).."
  useradd --create-home --non-unique --uid "${GIVEN_USER_ID}" --gid "${GIVEN_GROUP_ID}" "${GIVEN_USER}"
  if [ -n "${ENTRYPOINT_GROUPS}" ]
  then
    echo "Adding ${GIVEN_USER} to groups: ${ENTRYPOINT_GROUPS}..."
    usermod -a -G "${ENTRYPOINT_GROUPS}" "${GIVEN_USER}"
  fi
else
  if [ "${GIVEN_USER_ID}" = "0" ]
  then
    cp --recursive --no-dereference /etc/skel/. /root/
  fi
fi

# 'gosu' is used to run the executable on behalf of the just created user. (gosu has 1:1 parity with "docker --user")
# (idea.sh itself runs a foreground process utilizing 'exec')
gosu "${GIVEN_USER_ID}" "$@"
