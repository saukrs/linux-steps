#!/usr/bin/env sh

# Via: https://artofcode.wordpress.com/2021/02/04/how-to-install-kvm-qemu-on-linux-mint-20-1/

sudo apt-get -y install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo adduser $USER libvirt
sudo adduser $USER kvm
sudo adduser $USER libvirt-qemu
