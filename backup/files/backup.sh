#!/usr/bin/bash

sudo apt-get install rsync -y

sudo timedatectl set-timezone Asia/Kolkata
sudo localectl set-locale LC_TIME="C.UTF-8"
sudo echo 'LC_TIME="C.UTF-8"' >> /etc/default/locale
sudo locale-gen

sudo mkdir -p /mnt/backup
sudo mount /dev/sdb /mnt/backup

sudo /usr/bin/rsync -aAXv --delete --dry-run --exclude=/tmp/* --exclude=/mnt/* --exclude=/dev/* \
 --exclude=/proc/* --exclude=/media/* --exclude=/run/* --exclude=/sys/* \
 --exclude="lost+found" --exclude=".cache" / /mnt/backup

# Remove --dry-run to actually perform the backup

#echo "Completed all the steps"
