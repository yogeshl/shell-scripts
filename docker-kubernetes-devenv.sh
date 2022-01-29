#!/bin/bash

# VM Setup - Docker Setup

# Install Docker:
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh


# Edit the Docker Service:
nano /lib/systemd/system/docker.service

# Add below lines
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376 --containerd=/run/containerd/containerd.sock

# Reload systemctl and restart Docker:
systemctl daemon-reload
systemctl restart docker



# Client/Host Machine - Docker Client Setup

# Download the Docker client
https://download.docker.com/win/static/stable/x86_64/

# Set the environment variable DOCKER_HOST; x.x.x.x is the IP or hostname of your dev VM.
$Env:DOCKER_HOST = "x.x.x.x:2376"


# VM Setup - Kubernetes setup

# Install Kubernetes (Minikube)
curl https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 --output minikube
cp minikube /usr/local/bin/minikube
chmod +x /usr/local/bin/minikube

#Create a Minikube context
apt install conntrack
minikube start --driver=none

# Client/Host Machine - Kubectl Client Setup

#Download the Kubernetes CLI (Kubectl)
https://kubernetes.io/releases/

#Copy the config and certificates from VM to Host Machine:

 /root/.kube/config     -> %USERPROFILE%/.kube/config
 /root/.minikube/ca.crt 
 /root/.minikube/profiles/minikube/client.crt
 /root/.minikube/profiles/minikube/client.key


#update the config to match the absolute path for ca.crt, client.crt and client.key

#Reference: https://www.youtube.com/watch?v=BIXEaRSnnW8