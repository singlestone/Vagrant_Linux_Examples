#!/usr/bin/env bash

## RT Ticket system.

export DEBIAN_FRONTEND=noninteractive
cp /vagrant/config/etc/apt/sources.list /etc/apt/
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y build-essential openssl libyaml-0-2 libyaml-libyaml-perl libyaml-appconfig-perl libexpat1-dev apache2 mysql-server mysql-client exim4-daemon-light eximon4 mailutils libcurl4-openssl-dev libapache2-mod-fastcgi

mysqladmin -u root password yhs.is4U
tar xzvf /vagrant/rt-4.2.12.tar.gz  -C /usr/local/src
cd /usr/local/src/rt-4.2.12/
/usr/local/src/rt-4.2.12/configure

cp /vagrant/config/etc/apache2/sites-available/001-requesttracker.conf /etc/apache2/sites-available/ 

#dpkg-reconfigure exim4-config
#cp /vagrant/config/etc/exim4.conf.localmacros /etc/
#nano -w /etc/aliases



a2enmod fastcgi
a2dissite 000-default.conf
a2ensite 001-requesttracker.conf


sed -e 's/\t\([\+0-9a-zA-Z]*\)[ \t].*/\1/' << EOF | /usr/bin/perl -MCPAN -e shell
	y
	y
EOF

perl -MCPAN -e 'install CPAN'
perl -MCPAN -e 'Module::Reload'

sed -e 's/\t\([\+0-9a-zA-Z]*\)[ \t].*/\1/' << EOF | make fixdeps
	
	
	
EOF

#make testdeps
make install

service mysql start
PASWD="notch"
sed -e 's/\t\([\+0-9a-zA-Z]*\)[ \t].*/\1/' << EOF | make initialize-database
	$PASWD
EOF




##service exim4 restart
service apache2 restart
 
 






