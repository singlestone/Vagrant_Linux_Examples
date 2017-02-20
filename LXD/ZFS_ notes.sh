


###############
## For adding ZFS
###############
#apt-get install -y ubuntu-zfs

#lxc-create -t ubuntu -n test1  zfs -- -S /root/.ssh/id_rsa.pub
#lxc-create -t ubuntu -n test2 -B zfs -- -S /root/.ssh/id_rsa.pub
#zfs set dedup=on tank
#zfs set compression=on tank

#zpool set listsnapshots=on tank
#lxc.lxcpath = /tank/lxc/containers
#lxc.bdev.zfs.root = tank/lxc/containers

#zfs create tank/lxc
#zfs create tank/lxc/containers
