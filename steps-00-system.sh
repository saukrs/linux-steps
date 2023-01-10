#!/usr/bin/env sh

set -e                                  # Stop on the 1st error

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
sudo apt install -y tree
sudo apt install -y elinks
sudo apt install -y tmux
sudo apt install -y colordiff
sudo apt install -y pv
sudo apt install    ipcalc
sudo apt install    ansible
sudo apt install    psmisc              # for pstree
