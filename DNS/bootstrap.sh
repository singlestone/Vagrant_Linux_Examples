#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get install -y bind9

cp /vagrant/named.conf.options /etc/bind/named.conf.options 
cp /vagrant/named.conf /etc/bind/named.conf
service bind9 restart
