#!/bin/bash

docker2aci quay.io/alban/dind:dockerinrocket
actool patch-manifest --replace --capability=CAP_NET_ADMIN alban-dind-dockerinrocket.aci

