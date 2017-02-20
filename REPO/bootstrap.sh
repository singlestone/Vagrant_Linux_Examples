#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get install -y apt-mirror
apt-get install -y apache2
mkdir /share
echo "192.168.1.20:/volume1/NAS_Drive/Linux/Mirror  /share  nfs     defaults        0       0"  >> /etc/fstab
mount 192.168.1.20:/volume1/NAS_Drive/Linux/Mirror  /share

#apt-mirror