#! /usr/bin/env sh

# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

# Set up WireGuard server peer.
# Via: https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-20-04

set -e

# Step 1: installing the package

sudo apt update
sudo apt install -y wireguard   # Runs DKMS installer
