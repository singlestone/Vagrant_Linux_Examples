#!/usr/bin/env bash

#hostname "Plex-Server"

apt-get wget -y
wget -O - http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | sudo apt-key add -
echo "deb http://www.deb-multimedia.org wheezy main non-free" | sudo tee -a /etc/apt/sources.list.d/deb-multimedia.list
echo "deb http://shell.ninthgate.se/packages/debian wheezy main" | sudo tee -a /etc/apt/sources.list.d/plex.list

apt-get install deb-multimedia-keyring -y --force-yes
apt-get update
apt-get upgrade -y
apt-get install -y plexmediaserver

#tar xzvf /vagrant/plexmediaserver.tar.gz  -C /
#service plexmediaserver restart

#sudo tar czvf /vagrant/plexmediaserver.tar.gz plexmediaserver/

