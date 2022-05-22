#!/bin/bash

set -ex

cd "${0%/*}"

# this script requires at most one parameter
if [ "$#" -gt 1 ]
then
    printf "Illegal number of arguments\n" >&2
    exit 1
fi

SUITE=${1:-bullseye}

IMAGE="localhost/debian-networking-${SUITE}:latest"

CONT=$(buildah from localhost/debian-systemd-${SUITE})

buildah copy $CONT setup/ /setup
buildah run $CONT /bin/bash /setup/setup.sh
buildah commit --rm $CONT $IMAGE

