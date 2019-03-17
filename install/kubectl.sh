#!/bin/sh

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl
