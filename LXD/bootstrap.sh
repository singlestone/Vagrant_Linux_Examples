#!/usr/bin/env bash

## This bootstrap is designed for installing lxc, lxd,
## and setting up LVMS on on a system with a none partitioned second data disk of any size.
## This is meant for learing and developement and not for system deployment.



## add repositories
add-apt-repository ppa:webupd8team/java
add-apt-repository ppa:ubuntu-lxc/lxd-stable
add-apt-repository ppa:ubuntu-lxc/lxd-daily
add-apt-repository ppa:zfs-native/daily


## Install and update
apt-get update
apt-get upgrade -y
apt-get install -y lvm2
apt-get install -y lxc
apt-get install -y lxd


Configure drive partitions local disk.
# to create the partitions programatically (rather than manually)
# line terminated with a newline to take the gdisk default.
sed -e 's/\t\([\+0-9a-zA-Z]*\)[ \t].*/\1/' << EOF | gdisk /dev/sdb
	o # clear the in memory partition table
	y # confirm
	n # new partition
	1 # partition number 1
	  # default 2048
	  # default 167772126
	  # Linux filesystem
	  # 8300
	w # write the partition table
	y # confirm
EOF


pvcreate /dev/sdb1
vgcreate pool /dev/sdb1
lvcreate -n disk1 -L 8g pool
lvcreate -n disk2 -L 8g pool

mkfs.ext3 /dev/pool/disk1
mkfs.ext4 /dev/pool/disk2

lxc-create -t ubuntu -n test1
lxc-create -t ubuntu -n test2

mkdir /var/lib/lxc/test1/rootfs/mnt/lvm
echo "/dev/pool/disk1 /var/lib/lxc/test1/rootfs/mnt/lvm   ext3  rw,suid,dev,noexec,auto,user,async      0  0" >> /etc/fstab
echo "/dev/pool/disk2 /var/lib/lxc/test1/rootfs/mnt/lvm   ext4  rw,suid,dev,noexec,auto,user,async      0  0" >> /etc/fstab
mount -a

#lxc-start -n test1
