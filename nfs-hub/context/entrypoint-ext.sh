#!/usr/bin/env bash
#
# Intentionally created to mount NFS dynamically and map uid/guid appropriately.
#
# Globals:
#   NFS_URI     NFS URI <ip>:<path>, e.g. 192.168.178.28:/volume1/archive
#   NFS_UID     NFS directory owner's user id
#   NFS_GID     NFS directory owner's group id
#   GIVEN_UID   user id to translate NFS directory ownership into
#   GIVEN_GID   group id to translate NFS directory ownership into

echo "Adding interceptor for SIGHUP, SIGINT or SIGTERM to gracefully shutdown .."
trap "echo Umounting ..; umount --force /nfs /mnt; echo Done.; exit" SIGHUP SIGINT SIGTERM

echo "Mounting ${NFS_URI} .."
mount --verbose --types nfs4 --options nolock,exec "${NFS_URI}" /mnt

echo "Mirroring contents to map between ${NFS_UID}:${NFS_GID} and ${GIVEN_UID}:${GIVEN_GID} .."
# Runs in foreground and put to background to be able to catch PID via $! which otherwise would be empty! 
bindfs -f -d --map="${NFS_UID}/${GIVEN_UID}:@${NFS_GID}/@${GIVEN_GID}" /mnt "${BINDFS_TARGET_ROOT}" &
PID=$!

echo "Waiting for bindfs to change state to exit .."
wait $PID
