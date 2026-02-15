# 🎬 Serveur multimédia local avec Jellyfin et téléchargement avec Qbittorent

## 1. 🎯 Objectif

L'objectif de ce projet présente l’installation de Jellyfin et Qbittorent pour avoir son propre serveur multimédia où les médias sont téléchargé et stocker au même endroit.

Cela signifie que les médias personnels (films,séreis,vidéo personnel, musique seront direstement sur votre serveur.

La gestion de flux en ligne se fera avec Qbittorent.

La lecture se fera avec Jellyfin. 

## 2. 📦 Installation 
Il faut d'abord faire la mise à jour du système.
````bash
sudo apt update && sudo apt upgrade
sudo apt install curl
````
### Installation de Jellyfin 
Une fois fait nous pouvons procéder au téléchargement et à l'installation :
````bash
curl -s https://repo.jellyfin.org/install-debuntu.sh | sudo bash
sudo apt install jellyfin
````
Vérifions si Jellyfin est actif :
````bash
sudo systemctl status jellyfin
````
