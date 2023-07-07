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
---------------------------------------------------------------------- |
[Interface]
PrivateKey = $(sudo cat /etc/wireguard/private.key)
Address = ${WG_ADDR}
ListenPort = ${WG_PORT}
SaveConfig = true
----------------------------------------------------------------------
sudo tee /etc/wireguard/wg0.conf


# Step 4: ensuring IP packets are forwarded between interfaces

cat << \
---------------------------------------------------------------------- |
net.ipv4.ip_forward = 1
----------------------------------------------------------------------
sudo tee /etc/sysctl.d/11-ip_forward.conf | sudo sysctl -p-


# Step 5: configuring firewall

UPLINK_DEV=$(ip route list default | awk '{ for (i=1; i<=NF; i++) if ($i == "dev") print $(i+1) }')

cat << \
----------------------------------------------------------------------- |

PostUp = ufw route allow in on wg0 out on ${UPLINK_DEV}
PostUp = iptables -t nat -I POSTROUTING -o ${UPLINK_DEV} -j MASQUERADE

PreDown = ufw route delete allow in on wg0 out on ${UPLINK_DEV}
PreDown = iptables -t nat -D POSTROUTING -o ${UPLINK_DEV} -j MASQUERADE
-----------------------------------------------------------------------
sudo tee -a /etc/wireguard/wg0.conf
