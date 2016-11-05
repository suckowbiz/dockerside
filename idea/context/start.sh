#!/usr/bin/env bash
#
# Sets up a given user environment and starts idea.
set -e

if [ "${LICENSE_ACCEPTED}" = "true" ]
then
  mv ~/.java.disabled ~/.java
fi

/opt/idea/bin/idea.sh
