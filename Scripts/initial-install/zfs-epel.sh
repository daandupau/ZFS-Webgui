#!/bin/bash
####################################################
zfsrepo=/etc/yum.repos.d/zfs.repo
OUTPUT="input.txt"

####################################################

# dialog for epel release
>$OUTPUT
trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM

dialog --title "zfs-epel" \
--input-box "For latest release: https://github.com/zfsonlinux/zfs/wiki/RHEL-and-CentOS" 10 150 2>$OUTPUT
respose=$?

ZFSURL=$(<$OUTPUT)
case $respose in
  0) 
  	zfs=${ZFSURL}
  	;;
  1) 
  	echo "Cancel pressed." 
  	;;
  255) 
   echo "[ESC] key pressed."
esac

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
