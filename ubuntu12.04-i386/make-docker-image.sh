#!/bin/bash -e
#
# Create a base Ubuntu Docker image.
#
# Adapted from [build-image.sh](https://github.com/docker-32bit/ubuntu/blob/master/build-image.sh)

### settings
arch=i386
suite=precise
chroot_dir='/var/chroot/precise'
apt_mirror='http://archive.ubuntu.com/ubuntu'

### make sure that the required tools are installed
apt-get update
apt-get install -y debootstrap dchroot

### install a minbase system with debootstrap
export DEBIAN_FRONTEND=noninteractive
debootstrap --variant=minbase --arch=$arch $suite $chroot_dir $apt_mirror

### update the list of package sources
cat <<EOF > $chroot_dir/etc/apt/sources.list
deb $apt_mirror $suite main restricted universe multiverse
deb $apt_mirror $suite-updates main restricted universe multiverse
deb $apt_mirror $suite-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu $suite-security main restricted universe multiverse
deb http://extras.ubuntu.com/ubuntu $suite main
EOF

### install ubuntu-minimal
cp /etc/resolv.conf $chroot_dir/etc/resolv.conf
mount -o bind /proc $chroot_dir/proc
chroot $chroot_dir apt-get update
chroot $chroot_dir apt-get -y install ubuntu-minimal

### cleanup and unmount /proc
chroot $chroot_dir apt-get autoclean
chroot $chroot_dir apt-get clean
chroot $chroot_dir apt-get autoremove
rm $chroot_dir/etc/resolv.conf
umount -lf $chroot_dir/proc

### create a tar archive from the chroot directory
tar cfz /vagrant/ubuntu12.04.tar.gz -C $chroot_dir .

# ### cleanup
rm -rf $chroot_dir
