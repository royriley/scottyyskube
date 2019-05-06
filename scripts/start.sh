#!/bin/sh

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi

minikube start --vm-driver=none \
  --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf
helm init
