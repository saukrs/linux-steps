#!/usr/bin/env sh

# 2022-11-07 saukrs: https://downloads.slack-edge.com/releases/linux/4.28.184/prod/x64/slack-desktop-4.28.184-amd64.deb

DOWNLOAD_URLS_PAGE="https://slack.com/intl/en-gb/downloads/instructions/ubuntu"

curl $DOWNLOAD_URLS_PAGE \
  | elinks -dump \
  | awk '/deb$/ {print $NF}' \
  | xargs curl -N -# -O
