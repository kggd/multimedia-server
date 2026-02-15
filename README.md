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
### 2.1 Installation de Jellyfin 
Une ois fait nous pouvons procéder au téléchargement et à l'installation :
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
### 2.2 Installation de qBittorent
Téléchargement de qBittorent : 
````bash
sudo apt install qbittorrent-nox
````
C'est un service qui se lance manuellement pour le lancer il suffit d'écrire dans le terminal :
````bash
qbittorrent-nox
````
Pour y accéder, allée sur votre navigateur en faisant :
````cpp
http://ip_du_serveur:8080
````

Les identifiannts de base sont :
user : admin
passwd : généré aléatoirement qui est affiché après le lancement du service

## 3. ⚙️ Configuration de qBittorent
Pour que le lancement de qBittorent soit fait au démarrage nous allons créer un service à partir d'un script :
````bash
sudo nano /usr/local/bin/qbito.sh
````
Dedans nous allons mettre le script permettant le lancement :
````bash
#!/bin/bash
nohup qbittorrent-nox
````

Maintenant nous pouvons passer à la création du service. Nous allons avoir besoin sur script crée précedement poue lancer le service automatiquement:
````bash
sudo nano  /etc/systemd/system/qbito.service
````

Il y aura dedans :
````bash
[Unit]
Description=qBittorrent script
After=network.target

[Service]
ExecStart=/usr/local/bin/qbito.sh
Restart=on-failure
User=root

[Install]
WantedBy=multi-user.target
````

### 3.1 🔄 Activation du service au démarrage 
Pour que l'activation se fasse au démarrage faites la commande : 
````bash
sudo systemctl daemon-reload
````
Puis :
````bash
sudo systemctl enable qbito
sudo systemctl start qbito
````

### 3.2 🔎 Vérification du service 
Pour vérifier que le service fonctionne bien :
````bash
sudo systemctl status qbito
````
S'il est écrit quelque chose comme : 
````bash
● qbito.service - qBittorrent script
     Loaded: loaded (/etc/systemd/system/qbito.service; enabled; preset: enabled)
     Active: active (running) since Sun 2026-02-15 07:33:02 -03; 11h ago
   Main PID: 1600 (qbito.sh)
      Tasks: 11 (limit: 18829)
     Memory: 3.5G (peak: 3.5G)
        CPU: 59.662s
     CGroup: /system.slice/qbito.service
             ├─1600 /bin/bash /usr/local/bin/qbito.sh
             └─1606 qbittorrent-nox
````
Cela signifie que le serice qui a été crée fonctionne bien.

Maintenant testons depuis l’interface Web pour être bien sur que cela fcontionne :
````cpp
http://ip_du_serveur:8080
````

Vous pourrez maintenant modifié votre mot de passe et le nom d'utilisateur de votre compte 

## 4. ⚙️ Configuration du firewall
Le firewall que nous utlisons est UFW. Nous allons voir comment le configurer de façon à ce que seuls les ports utlisé soit autorisé.

Comme d'habitude nous allons faire la mise à jour du système :
````bash
sudo apt update && sudo apt upgrade
````
Et installer UFW
````bash
sudo apt install ufw
````

Pour qu'il se lance automatiquement au démarrage faites la commande :
````bash
sudo ufw enable
````

Les différentes règles qui peuvent être appliquées sont l'autorisation au ports 8096 en tcp et en udp et 8080 tcp uniquement: 
````bash
sudo ufw allow 8096
sudo ufw allow 8080
sudo ufw allow 8096/tcp
sudo ufw allow 8096/udp
sudo ufw allow 8080/tp
````

Pour voir la liste des règles faites :
````bash
sudo ufw status
````

Dans le cas où vous avez une connexions en SSH ou par un autre protocole, il sera utile d'ajouter la règle :
````bash
sudo ufw allow 22
sudo ufw allow 22/tcp
````



