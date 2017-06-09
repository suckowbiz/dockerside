# nfs-hub

## Problem solved

My home NAS (Synology DiskStation DS313+) does not support Kerberos. To provide minimal security I can use flavour "AUTH_SYS" (see <https://www.synology.com/en-us/knowledgebase/DSM/tutorial/File_Sharing/How_to_access_files_on_Synology_NAS_within_the_local_network_NFS>).

The drawback of this method is that one has to mount the remote NFS shares having a local user with equal uid/gid as the owner of the files.

This Dockerfile makes it superfluous to do so by letting the current user see the remote NFS files as his own. (Actually the origin user has to be exist on host since Docker passes the uid/username mapping via kernel ;( )

## Run

...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

### Using public Docker Image (hub.docker.com)

Download <https://raw.githubusercontent.com/suckowbiz/dockerside/master/nfs-hub/nfs-hub> then run: `./nfs-hub <nfs uri> <nfs domain> <nfs uid> <nfs gid> <local mount point>`.

Example to mount my NAS `archive` directory to the existing directory `~/Archive`

```bash
./nfs-hub "192.168.178.28:/volume1/archive" nas 1026 100 "$HOME/Archive"
```
