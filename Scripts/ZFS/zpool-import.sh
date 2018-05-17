#!/bin/bash
####################################################
poolname=$1
d=$2

####################################################
if [ "$d" == "1" ];
then
disk="-d /dev/disk/by-id"
else
zpool import $poolname 
fi
exit