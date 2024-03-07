#!/usr/bin/env sh

sudo apt install -y openssh-server
ssh-copy-id localhost   # An interactive auth
echo "Running commands via SSH:"
ssh localhost "hostname; id; uptime"

cd; echo ".ssh\n.ssh/authorized_keys" | cpio -o | sudo sh -c 'cd; cpio --no-preserve-owner -iv'

echo "Running command as root:"
ssh root@localhost id
