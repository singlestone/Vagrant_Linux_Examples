#!/usr/bin/env bash

yum install -y wget
yum install -y xinetd 
yum install -y tftp-server
yum install -y httpd
yum install -y nfs-utils
yum install -y samba

echo 0 > /sys/fs/selinux/enforce
systemctl disable firewalld

wget -O /tmp/erpxe-1.2.tar.gz 'https://iweb.dl.sourceforge.net/project/erpxe/erpxe-1.2.tar.gz' 
tar -xvzf /tmp/erpxe-1.2.tar.gz -C /

\cp /vagrant/configs/etc/xinetd.d/tftp   /etc/xinetd.d/tftp
\cp /vagrant/configs/etc/samba/smb.conf  /etc/samba/smb.conf
\cp /tftpboot/bin/setup/erpxe-httpd.conf /etc/httpd/conf.d/erpxe-httpd.conf
\cp /tftpboot/bin/setup/erpxe-exports    /etc/exports

chmod 667 /etc/samba/smb.conf

useradd --no-create-home -s /dev/null erpxe

(echo erpxe; echo erpxe) | smbpasswd -a erpxe

systemctl enable xinetd.service
systemctl enable httpd.service
systemctl enable nfs.service
systemctl enable smb.service

#restorecon -r /tftpboot
