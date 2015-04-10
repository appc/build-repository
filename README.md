# build-repository

Repository of tools to build ACIs for various projects.

## Status of each project

### Docker

build-repository has [projects/docker.sh](projects/docker.sh) to build an ACI. This uses [quay.io/alban/dind:dockerinrocket](https://quay.io/repository/alban/dind?tag=dockerinrocket), based on the [Docker-in-Docker](https://github.com/jpetazzo/dind/) repository.

```
$ cd projects && ./docker.sh
```

The ACI can be copied on a CoreOS computer:

```
$ scp alban-dind-dockerinrocker.aci core-01:/var/tmp/
```

Then, it can be started:

```
root@core-01:~# DOCKER_DAEMON_ARGS='-D -s=overlay' /var/tmp/rkt --insecure-skip-verify run -inherit-env --interactive  /var/tmp/alban-dind-dockerinrocket.aci
```

Once in the rkt shell, fix `/etc/resolv.conf` (see [rkt bug 660](https://github.com/coreos/rkt/issues/660)) and start Docker containers inside rkt:

```
# docker run --rm busybox echo Yes this is a Docker container inside rkt
# docker run --rm -t -i busybox
```

### etcd

etcd has [scripts/build-aci](https://github.com/coreos/etcd/blob/master/scripts/build-aci) to build an ACI:

```
$ scripts/build-aci VERSION
```

### Flannel

Flannel has [dist/build-aci.sh](https://github.com/coreos/flannel/blob/master/dist/build-aci.sh) to build an ACI:

```
$ cd dist && ./build-aci.sh TAG
```
