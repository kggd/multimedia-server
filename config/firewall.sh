#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install ufw
sudo ufw enable
sudo ufw allow 8096
sudo ufw allow 8080
sudo ufw allow 8096/tcp
sudo ufw allow 8096/udp
sudo ufw allow 8080/tcp
sudo ufw status