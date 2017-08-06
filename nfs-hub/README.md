# nfs-hub

## Problem solved

My home NAS (Synology DiskStation DS313+) does not support Kerberos. To provide minimal security I can use flavour "AUTH_SYS" (see <https://www.synology.com/en-us/knowledgebase/DSM/tutorial/File_Sharing/How_to_access_files_on_Synology_NAS_within_the_local_network_NFS>).

The drawback of this method is that one has to mount the remote NFS shares having a local user with equal uid/gid as the owner of the files.

This Dockerfile makes it superfluous to be logged on as a user with remote uid/gid since ownwership is mapped.

## Run

...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

### Using public Docker Image (hub.docker.com)

Download:

```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/nfs-hub/nfs-hub > /usr/bin/nfs-hub && sudo chmod +x /usr/bin/nfs-hub
```

Then run: 

```bash
nfs-hub <nfs uri> <nfs domain> <nfs uid> <nfs user> <nfs gid> <nfs group> <local mount point>
```

Example to mount my NAS `archive` directory to the existing directory `~/Archive`

```bash
nfs-hub "192.168.178.28:/volume1/archive" nas 1026 tobias 100 users "$HOME/Archive"
```

=======

Notes:

<https://www.kernel.org/doc/Documentation/filesystems/nfs/idmapper.txt>
