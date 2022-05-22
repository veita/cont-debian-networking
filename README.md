# Intrexx

## Services

* SSHD
* Postfix
* PostgreSQL

## Base image

The base image is `localhost/debian-systemd-${SUITE}` where `${SUITE}` is either `BUSTER`,
or `BULLSEYE`, or `BOOKWORM`.

The base image is provided by the [debian-systemd](https://github.com/veita/debian-systemd)
project.


## Building the container

```bash
git clone https://github.com/veita/debian-networking.git
cd debian-networking
./build-image.sh

```


## Running the container

Run the container, e.g. with

```bash
podman run --detach --rm --cap-add audit_write,audit_control -p=10022:22 localhost/debian-networking
```

`podman ps` reports the exposed ports of the running container:

```
CONTAINER ID  IMAGE                                   COMMAND     CREATED        STATUS            PORTS                                                        NAMES
339f33f2d115  localhost/debian-networking  /sbin/init  6 seconds ago  Up 5 seconds ago  0.0.0.0:10022->22/tcp debian-networking
```

