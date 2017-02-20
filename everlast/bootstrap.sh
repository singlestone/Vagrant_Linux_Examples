#!/usr/bin/env bash

## This bootstrap is designed for installing lxc, lxd,
## and setting up LVMS on on a system with a none partitioned second data disk of any size.
## This is meant for learing and developement and not for system deployment.

## add repositories

export DEBIAN_FRONTEND=noninteractive

## Install and update
apt-get update
apt-get upgrade -y
apt-get install -y mysql-server
apt-get install -y samba samba-common python-glade2

mysqladmin -u root password a4DyYu4Ahddv0nVEJBl9


cp /vagrant/config/etc/mysql/my.cnf /etc/mysql/

service mysql restart

mysql -u root -pa4DyYu4Ahddv0nVEJBl9 < /vagrant/config/SQL_scripts/user_permissions.sql
mysql -u root -pa4DyYu4Ahddv0nVEJBl9 < /vagrant/config/SQL_scripts/database_creation.sql
mysql drupaldb_1 -u root -pa4DyYu4Ahddv0nVEJBl9 < /vagrant/config/bak/drupaldb.sql


mkdir -p /shares/rocky
addgroup rocky
chown root:rocky /shares/rocky
chmod 770 /shares/rocky/
cp /vagrant/config/etc/samba/smb.conf /etc/samba/
service smbd restart

useradd file_admin -s /usr/sbin/nologin -G rocky
echo -e "9sXXa78R1PwtGvnFlkYP\n9sXXa78R1PwtGvnFlkYP" | smbpasswd -s -a file_admin

#pass = '9sXXa78R1PwtGvnFlkYP'
#echo -e "$pass\n$pass" | smbpasswd -s -a $user