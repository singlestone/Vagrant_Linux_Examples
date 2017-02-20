#!/usr/bin/env bash

## Order of operations

containter_name = PlexSRVR
containter_type = ubuntu

# 1. Create LXC Container

lxc-create -t $containter_type -n $containter_name

# 2. Create App Data Volume

lvcreate -n disk1 -L 8g pool
mkfs.ext4 /dev/pool/disk_$containter_name

# 3. Create LXC fstab
# 4. Create LXC Config File
# 5. Create LXC Networking Configuation
# 6. copy Server Configuration script and run it.

lxc-create -t ubuntu -n PlexSRVR
lxc-start -n PlexSRVR -d



#lvcreate -n disk1 -L 8g pool
#mkfs.ext3 /dev/pool/disk1

#lvcreate -n disk2 -L 8g pool
#mkfs.ext4 /dev/pool/disk2