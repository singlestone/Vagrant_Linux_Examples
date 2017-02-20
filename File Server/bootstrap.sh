#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
mkdir /share
echo "192.168.1.20:/volume1/NAS_Drive/Linux   /share  nfs     defaults        0       0"  >> /etc/fstab
mount 192.168.1.20:/volume1/NAS_Drive/Linux   /share
mkdir .ssh
chmod 700 .ssh
