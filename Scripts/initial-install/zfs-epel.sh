#!/bin/bash
####################################################
zfsrepo=/etc/yum.repos.d/zfs.repo
zfs=${$1}

####################################################

yum install $zfs -y
gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
echo zfs-release packages installed

echo switching from dkms to kABI-tracking kmod
sed -i '4s/.*/enabled=0/' $zfsrepo
sed -i '12s/.*/enabled=1/' $zfsrepo

echo loading zfs-packages
yum update -y

yum install zfs -y
rm $OUTPUT

exit
