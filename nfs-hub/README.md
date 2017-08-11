# nfs-hub

Mounts a remote Network File System (NFS) to local user having bidirectional ownership mapping.

## Problem Solved

My home NAS (Synology DiskStation DS313+) does not support Kerberos. To provide minimal security I can use flavour "AUTH_SYS" (see <https://www.synology.com/en-us/knowledgebase/DSM/tutorial/File_Sharing/How_to_access_files_on_Synology_NAS_within_the_local_network_NFS>).

The drawback of this method is that one has to mount the remote NFS shares having a local user with equal uid/gid as the owner of the files.

This Dockerfile makes it superfluous to be logged on as a user with remote uid/gid since ownership is mapped.

## Usage Example

Download run script to have `nfs-hub` available:

```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/nfs-hub/nfs-hub > /var/tmp/nfs-hub && sudo mv /var/tmp/nfs-hub /usr/local/bin/ && sudo chmod +x /usr/local/bin/nfs-hub
```

Example to mount a remote Network File System (NFS):

1. Remote NFS uri: `192.168.178.28:/volume1/archive`
1. Remote NFS domain name (setup of your NAS): `nas` 
1. Remote NFS user id: `1026`, username: `tobias`
1. Remote NFS group id: `100`, groupname: `users`
1. Local mount point: `/mnt`

Run¹: 

```bash
nfs-hub '192.168.178.28:/volume1/archive' nas 1026 tobias 100 users '/mnt'
```

¹: Will create the remote user on your local machine to enable ownership mapping.

References:

- <https://www.kernel.org/doc/Documentation/filesystems/nfs/idmapper.txt>
- <http://bindfs.org/>
