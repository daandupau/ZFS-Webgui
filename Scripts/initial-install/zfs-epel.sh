#!/bin/bash
####################################################
zfsrepo=/etc/yum.repos.d/zfs.repo


####################################################

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else

echo "copy in the latest zfs epel release"
echo "For latest release: https://github.com/zfsonlinux/zfs/wiki/RHEL-and-CentOS"
read zfs

yum install $zfs -y
gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
echo zfs-release packages installed

echo switching from dkms to kABI-tracking kmod
sed -i '4s/.*/enabled=1/' $zfsrepo
sed -i '12s/.*/enabled=0/' $zfsrepo

echo loading zfs-packages
yum update -y

yum install zfs -y

echo zfs installed
fi