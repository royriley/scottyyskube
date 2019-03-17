#!/bin/sh

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi

curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.34.1/minikube-linux-amd64 && chmod +x minikube && cp minikube /usr/local/bin/ && rm minikube
