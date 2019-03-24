#!/bin/sh

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi

apt-get -y install socat # required for port forwarding.

curl -s -O https://storage.googleapis.com/kubernetes-helm/helm-v2.13.0-linux-amd64.tar.gz
if echo '15eca6ad225a8279de80c7ced42305e24bc5ac60bb7d96f2d2fa4af86e02c794  helm-v2.13.0-linux-amd64.tar.gz' | shasum --status -a 256 -c; then
    tar -zxvf helm-v2.13.0-linux-amd64.tar.gz
    mv linux-amd64/helm /usr/local/bin/helm
else
    echo "WARNING: Downloaded Helm binary did not match checksum"
fi
