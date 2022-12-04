# Container for debugging container network problems

Pre-installed tools and packages
* SSH
* OpenSSL
* net-tools
* iputils-ping
* iproute2
* ethtool
* dnsutils
* dnsdiag
* arping
* nmap
* tcpdump
* telnet
* netcat-openbsd
* wget
* curl


## Base image

The base image is `localhost/debian-systemd-${SUITE}` where `${SUITE}` is either `BUSTER`,
or `BULLSEYE`, or `BOOKWORM`.

The base image is provided by the [debian-systemd](https://github.com/veita/cont-debian-systemd)
project.


## Building the container

```bash
git clone https://github.com/veita/cont-debian-networking.git debian-networking
cd debian-networking
./build-image.sh

```


## Running the container

Run the container, e.g. with

```bash
podman run --detach --rm --cap-add audit_write,audit_control,net_raw -p=10022:22 localhost/debian-networking
```

