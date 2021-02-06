![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) [![Docker Repository on Quay](https://quay.io/repository/suckowbiz/base/status "Docker Repository on Quay")](https://quay.io/repository/suckowbiz/base)

# base

The parent Docker Image for all Dockerfiles. It contains a core entrypoint script that is common for all child Docker Images.

## Entrypoint

The base image contains an `entrypoint.sh` script that is used throughout all child images as Docker Entrypoint. Its purpose is to run the Docker File application on behalf of a given user. This helps to align file and directory ownership in case of newly created or edited files.


The `entrypoint.sh` reads envrionment variables to set up the required runtime:

- **Root Privileges** Run as root when `${ENTRYPOINT_AS_ROOT}` equals `yes`.
- **Specific User** Run as specific user with name: `${GIVEN_USER}` and id: `${GIVEN_USER_ID}`.
  - **User Group** Associate the given user to a user group with name: `${GIVEN_GROUP}` and id: `${GIVEN_GROUP_ID}`.
  - **System Group Association** Additional association of the user to system groups such as `audio` or `video`. `${ENTRYPOINT_GROUPS}` accepts a comma separated list of system group names.
- **Working Directory** Setting the initial working directory to a specific folder as specified in: `${ENTRYPOINT_WORKDIR}`