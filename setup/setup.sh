#!/bin/bash

set -ex

SUITE=$(lsb_release -sc)

IX_INSTALL_DIR="/opt/intrexx"

export DEBIAN_FRONTEND=noninteractive

apt-get update -qy
apt-get upgrade -qy

apt install -qy \
    mc git rsync net-tools iputils-ping iproute2 ethtool \
    dnsutils dnsdiag arping nmap tcpdump netcat-openbsd

# cleanup
apt-get clean -qy
apt-get autoremove -qy

rm -rf /setup/tmp
rm -rf /tmp/* /var/tmp/*