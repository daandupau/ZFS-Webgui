#!/bin/bash
####################################################
poolname=$1
d=$2

####################################################
if [ "$d" != "" ];
then
disk="-d /dev/disk/by-id"
else
zpool import $poolname 
fi
exit