#! /usr/bin/env sh

# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

# Set up Webmin (using the official repo).
# Via: https://doxfer.webmin.com/Webmin/Installation#apt_.28Debian.2FUbuntu.2FMint.29

set -e

curl -fsSL http://www.webmin.com/jcameron-key.asc | sudo apt-key add -

cat << \
----------------------------------------------------------------- |
deb https://download.webmin.com/download/repository sarge contrib
-----------------------------------------------------------------
sudo tee /etc/apt/sources.list.d/webmin.list

sudo apt-get update
sudo apt-get install -y webmin
