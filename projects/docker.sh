#!/bin/bash

docker2aci quay.io/alban/dind:dockerinrocket
actool patch-manifest --replace --capability=CAP_NET_ADMIN alban-dind-dockerinrocket.aci

## Example how to use it
########################


## Copy the aci
# scp alban-dind-dockerinrocker.aci core-01:/var/tmp/

## On the host

# DOCKER_DAEMON_ARGS='-D -s=overlay' /var/tmp/rkt --insecure-skip-verify run -inherit-env --interactive  /var/tmp/alban-dind-dockerinrocket.aci

## In Rocket:

## Populate /etc/resolv.conf or fix https://github.com/coreos/rocket/issues/660
# echo nameserver 10.0.2.3 > /etc/resolv.conf

# docker run --rm busybox echo Yes this is a Docker container inside Rocket
# docker run --rm -t -i busybox



