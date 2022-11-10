#!/usr/bin/env sh

# 2022-11-10 saukrs;
# Via: https://github.com/bcicen/ctop#debianubuntu

sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://azlux.fr/repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/azlux-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian \
  stable main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo apt-get update
sudo apt-get install docker-ctop
