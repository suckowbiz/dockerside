# docker-spss
Build a Docker image to run IBM SPSS

# How do I run it?
1. Download (US) IBM SPSS Linx 64Bit version Version [here](http://www-01.ibm.com/software/de/analytics/spss/downloads.html).
2. Place the downloaded file *SPSS_Statistics_24_lin.bin* within `./spss/`.
3. Disable appropriate part of `docker-compose.yaml` then run `docker-compose build spss` and run `./spss/spss` (provide a license or run your trial).
