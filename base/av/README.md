![Ubuntu Linux](https://img.shields.io/badge/tested-ubuntu-green.svg) [![Docker Repository on Quay](https://quay.io/repository/suckowbiz/base-av/status "Docker Repository on Quay")](https://quay.io/repository/suckowbiz/base-av)

# base-av

Common base for audio/video applications.

```
       +------+
       |      |
       | base |
       |      |
       +^-----+
        |
        |
    +---++
    |    |
    | av |
    |    |
    +-^--+
      |
      |
+-----+-------------------+
|                         |
| audio video using image |
|                         |
+-------------------------+
```

To run audio video applications this Docker Image includes packages to play sound and integrate video capabilies required for GUI based applications like e.g. a web browser.