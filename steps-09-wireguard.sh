#! /usr/bin/env sh

# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

# Set up WireGuard server peer.
# Via: https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-20-04

set -e

# Step 1: installing the package

sudo apt update
sudo apt install -y wireguard   # Runs DKMS installer

wg genkey | sudo tee /etc/wireguard/private.key
sudo chmod go= /etc/wireguard/private.key

sudo cat /etc/wireguard/private.key | wg pubkey | sudo tee /etc/wireguard/public.key


# Step 2: choosing the private IP subnet

WG_ADDR="10.8.0.1/24"


# Step 3: creating WG configuration

WG_PORT=51876

cat << \
--------------------------------------------------- |
[Interface]
PrivateKey = $(sudo cat /etc/wireguard/private.key)
Address = ${WG_ADDR}
ListenPort = ${WG_PORT}
SaveConfig = true
---------------------------------------------------
sudo tee /etc/wireguard/wg0.conf
