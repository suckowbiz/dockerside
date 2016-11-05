#!/usr/bin/env bash

CONTAINER_NAME="proxy"
DOCKER=`which docker`

$DOCKER rm -f $CONTAINER_NAME >/dev/null 2>&1 || true
$DOCKER run \
 --detach=true \
 --env TOR_EXCLUDE_EXIT_NODES="{de}" \
 --name proxy \
 --publish 0.0.0.0:3128:3128 \
 suckowbiz/proxy 
