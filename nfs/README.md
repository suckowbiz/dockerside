# nfs

Mounts a remote Network File System (NFS) to local user (UID/GID must match the remote ones!).

## Usage Example

Download run script to have `nfs` available:

```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/nfs/nfs > /var/tmp/nfs && sudo mv /var/tmp/nfs /usr/local/bin/ && sudo chmod +x /usr/local/bin/nfs
```

Example to mount a remote Network File System (NFS):

1. Remote NFS uri: `192.168.178.28:/volume1/archive`
1. Remote NFS domain name (setup of your NAS): `nas` 
1. Local mount point: `/mnt`

Run: 

```bash
nfs '192.168.178.28:/volume1/archive' nas '/mnt'
```
