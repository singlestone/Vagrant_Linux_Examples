#!/usr/bin/env bash

## This bootstrap is designed for installing lxc, lxd,
## and setting up LVMS on on a system with a none partitioned second data disk of any size.

## Install and update
apt-get update
apt-get upgrade -y
apt-get install -y lvm2
#apt-get install -y lxc
apt-get install -y lxd

service lxd start

lxd-images import lxc ubuntu trusty amd64 --alias ubuntu --alias ubuntu/trusty
lxc launch ubuntu my-ubuntu


#Configure drive partitions local disk.
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
## Finished Provisioning Application Drive.

#lxc config profile create micro
#lxc config profile set micro limits.memory 256M
#lxc config profile show micro