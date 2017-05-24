# nfs-hub

Mounts NFS shares and maps uid/gid between NFS and local user to get rid of NFS file ownership issues.

## Run

...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

Variables:

- `<nfs uri>` - e.g. 192.168.178.28:/volume1/archive
- `<nfs uid>` - user id of NFS user that owns the files on NFS, e.g. 1025
- `<nfs gid>` - group id of NFS user that owns the files on NFS, e.g. 100
- `<mount point>` - path to local directory to mount the NFS share to

Note: ID and GUID of given User are taken to map between NFS and local host.

### Using public image from Docker registry

Download <https://raw.githubusercontent.com/suckowbiz/dockerside/master/nfs-hub/nfs-hub> then run `./nfs-hub <nfs uri> <nfs uid> <nfs gid> <mount point>`

### (Or Build from scratch) 

- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build nfs-hub`.
- `dockerside/nfs-hub/nfs-hub <nfs uri> <nfs uid> <nfs gid> <mount point>`.


