#!/usr/bin/env bash
#
# Intentionally added to override entrypoint.sh to enable post processing of user names.
set -e

# Set the nginx workers user to preserver file rights.
sed --in-place "s/user .*;/user ${GIVEN_USER} ${GIVEN_GROUP};/g" /etc/nginx/nginx.conf

exec "$@"
