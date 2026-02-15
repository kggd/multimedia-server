# 🎬 Serveur multimédia local avec Jellyfin et qBittorent

## 1. 🎯 Objectif

L'objectif de ce projet présente l’installation de Jellyfin et qBittorent pour avoir son propre serveur multimédia où les médias sont téléchargé et stocker au même endroit.

Cela signifie que les médias personnels (films,séreis,vidéo personnel, musique seront direstement sur votre serveur.

La gestion de flux en ligne se fera avec qBittorent.

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
Dans le cas où il n'est pas actif faire :
````bash
sudo systemctl status jellyfin
sudo systemctl enable jellyfin
````

Une fois actif, pour y accéder depuis son navigateur il faut connaitre l'IP de son serveur en faisans:
````bash
ip a
````
Et aller sur son navigateur en faisant :
````cpp
http://ip_du_serveur:8096
````
### Installation de qBittorent
Téléchargement de qBittorent : 
````bash
sudo apt install qbittorrent-nox
````
C'est un service qui se lance manuellement pour le lancer il suffit d'écrire dans le terminal :
````bash
qbittorrent-nox
````
