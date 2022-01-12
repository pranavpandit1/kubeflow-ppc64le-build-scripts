#!/bin/sh

sed -i 's/debian:stretch-slim/ppc64le\/debian:stretch-slim/g' Dockerfile


sudo docker build --network=host --pull . -t quay.io/ibm/${IMAGE}:${RELEASE}

set +x
echo $quay_p | sudo docker login --username $quay_u --password-stdin https://quay.io
set -x

sudo docker push quay.io/ibm/${IMAGE}:${RELEASE}
