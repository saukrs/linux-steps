#!/usr/bin/env sh

curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg

. /etc/os-release

cat << \
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $UBUNTU_CODENAME contrib
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
sudo tee /etc/apt/sources.list.d/vbox.list

sudo apt-get update
sudo apt-get -y install virtualbox-7.0

sudo usermod -aG vboxusers $USER
echo "You're added to VirtualBox Users group, please relogin"
