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

echo "Adding user ${NFS_USER} to provide UID for NFS UID mapping .."
useradd --create-home --non-unique --uid "${NFS_UID}" --gid "${NFS_GID}" "nfs-hub"

echo "Setting NFS domain and clearing the keyring of all the keys to updae NFS UID mapping .."
sed --in-place "s/.*Domain.*/Domain = nas/g" /etc/idmapd.conf 
/usr/sbin/nfsidmap -c 2>/dev/null

echo "Adding interceptor for SIGHUP, SIGINT or SIGTERM to umount on container stop .."
trap "echo Umounting ..; umount --force /nfs /mnt; echo Done.; exit" SIGHUP SIGINT SIGTERM

echo "Mounting ${NFS_URI} .."
# _netdev - device is a network share, wait with mounting until networking established
# exec - can execute binary files
# soft - in interruptions wait for timout and stop then 
mount --verbose --types nfs4 --options _netdev,exec,soft "${NFS_URI}" /mnt

echo "Letting host user seeing files of NFS user as his own .."
bindfs --version
bindfs -d --map="${NFS_UID}/${GIVEN_UID}:@${NFS_GID}/@${GIVEN_GID}" /mnt "${BINDFS_TARGET_ROOT}" &
PID=$!

echo "Waiting for bindfs to change state to exit .."
wait $PID
