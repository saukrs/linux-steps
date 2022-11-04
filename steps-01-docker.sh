#!/usr/bin/env sh
# Via: https://docs.docker.com/engine/install/ubuntu/

set -e

# Naujame OSe nebuvo jokių paketų, nereikėjo ir išmest:
# sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

. /etc/os-release

cat << \
------------------------------------------------------------------------------------------------------------------------------------------------- |
deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable
-------------------------------------------------------------------------------------------------------------------------------------------------
sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Pakilo ir be šito:
# sudo service docker start

sudo docker run hello-world

sudo usermod -aG docker $USER
echo "You're added to Docker group, please relogin"
