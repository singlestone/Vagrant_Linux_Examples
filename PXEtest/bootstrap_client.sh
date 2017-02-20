#!/usr/bin/env bash

apt-get update
# apt-get upgrade
#cp /vagrant/ssh/sshd_config /etc/ssh/

cp /vagrant/ssh/id_dsa.pub /home/vagrant/.ssh/id_dsa.pub
cp /vagrant/ssh/sshd_config /etc/ssh/sshd_config
cat /home/vagrant/.ssh/id_dsa.pub >> /home/vagrant/.ssh/authorized_keys



#client
#-rw-r--r-- 1 root root 2538 Nov  2 20:28 /etc/ssh/sshd_config
#-rw------- 1 vagrant vagrant 862 Nov  2 20:26 authorized_keys

