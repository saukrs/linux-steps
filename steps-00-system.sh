#!/usr/bin/env sh

cd /etc
sudo git init
sudo git commit --allow-empty -m "Repository created"
cd
sudo apt install -y etckeeper           # Log the /etc changes

sudo apt install -y vim
sudo apt install -y htop iotop-c
sudo apt install -y traceroute          # for TCP tracing
sudo apt install -y asciinema
sudo apt install -y git
