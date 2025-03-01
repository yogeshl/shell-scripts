#!/bin/bash

# Steps to Install

# 1. Uninstall Docker
sudo apt-get remove docker docker-engine docker-ce docker.io

# 2. Update Package
sudo apt-get update

# 3. Allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# 4. Add the Docker Official GPG key to apt.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 5. Verify that you now have the Docker GPG key
sudo apt-key fingerprint 0EBFCD88

# 6. Add the Docker repository to apt
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# 7. Re-Update the apt-package index
sudo apt-get update

# 8. Install a specific version of docker
sudo apt-get install docker-ce

# 9. Add groups and users
sudo groupadd docker
sudo usermod -aG docker $USER
#Exit and log back in

# 10. Verify docker installation
docker version
docker run hello-world

# 11. Auto enable
sudo systemctl enable docker

# 12. Start docker if its not running.
sudo systemctl start docker
