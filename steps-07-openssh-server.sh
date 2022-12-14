#!/usr/bin/env sh

sudo apt install -y openssh-server
ssh-copy-id localhost   # An interactive auth
echo "Running commands via SSH:"
ssh localhost "hostname; id; uptime"
