#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install curl
curl -s https://repo.jellyfin.org/install-debuntu.sh | sudo bash
sudo apt install jellyfin
sudo systemctl start jellyfin
sudo systemctl enable jellyfin
sudo systemctl status jellyfin