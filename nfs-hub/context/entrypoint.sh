#!/usr/bin/env bash
#
# Intentionally created to mount NFS dynamically and map uid/guid appropriately.
#
# Globals:
#   GIVEN_GID   group id to translate NFS share ownership into
#   GIVEN_UID   user id to translate NFS share ownership into
#   NFS_DOMAIN  NFS domain as configured
#   NFS_GID     NFS share owner's group id
#   NFS_UID     NFS share owner's user id
#   NFS_URI     NFS URI <ip>:<path>, e.g. 192.168.178.28:/volume1/archive

#######################################
# Echo and exit if given argument neq zero.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
exit_for_previous_failue() {
    if [[ ! "$?" = "0" ]]; then
        echo "Exiting for previous failure."
        exit
    fi
}

echo "Adding interceptor for SIGHUP, SIGINT or SIGTERM to graceful shutdown."
trap "echo Gracefully shutting down ..; umount --force /nfs /mnt 2>/dev/null; exit" SIGHUP SIGINT SIGTERM

echo "Adding system user that corresponds with NFS uid to enable NFS uid mapping."
useradd --system --non-unique --uid "${NFS_UID}" --gid "${NFS_GID}" "nfs-hub"

echo "Setting NFS domain and clearing the keyring of all the keys to updae NFS UID mapping."
sed --in-place "s/.*Domain.*/Domain = ${NFS_DOMAIN}/g" /etc/idmapd.conf 
/usr/sbin/nfsidmap -c 2>/dev/null

# _netdev - device is a network share, wait with mounting until networking established
# exec - can execute binary files
# soft - in interruptions wait for timout and stop then 
mount --verbose --types nfs4 --options _netdev,exec,soft "${NFS_URI}" /mnt
exit_for_previous_failue

bindfs --version
bindfs -d --map="${NFS_UID}/${GIVEN_UID}:@${NFS_GID}/@${GIVEN_GID}" /mnt "${BINDFS_TARGET_ROOT}" &
exit_for_previous_failue
wait $!
