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

# 6. Add the Docker repository to apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 7. Re-Update the apt-package index
sudo apt-get update

# Make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# 8. Install a specific version of docker
sudo apt-get install docker-ce

# Check status
sudo systemctl status docker

# 9. Add groups and users
sudo groupadd docker
sudo usermod -aG docker $USER
#Exit and log back in

# run the following command to apply the group changes to your current session without logging out
newgrp docker

# 10. Verify docker installation
docker version
docker run hello-world

# 11. Auto enable
sudo systemctl enable docker

# 12. Start docker if its not running.
sudo systemctl start docker
