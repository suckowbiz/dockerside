#!/usr/bin/env bash
#
# Intentionally created to mount NFS dynamically and map uid/guid appropriately.
#
# Globals:
#   NFS_DOMAIN  NFS domain as configured
#   NFS_URI     NFS URI <ip>:<path>, e.g. 192.168.178.28:/volume1/archive

echo "Adding interceptor for SIGHUP, SIGINT or SIGTERM to graceful shutdown."
trap "echo Gracefully shutting down ..; umount --force /mnt 2>/dev/null; exit" SIGHUP SIGINT SIGTERM

echo "Setting NFS domain and clearing the keyring of all the keys to update NFS UID mapping."
sed --in-place "s/.*Domain.*/Domain = ${NFS_DOMAIN}/g" /etc/idmapd.conf
/usr/sbin/nfsidmap -c 2>/dev/null

# _netdev - device is a network share, wait with mounting until networking established
# exec - can execute binary files
# soft - in interruptions wait for timeout and stop then
mount --verbose --types nfs4 --options _netdev,exec,soft "${NFS_URI}" /mnt

tail -f /dev/null &
wait $!
