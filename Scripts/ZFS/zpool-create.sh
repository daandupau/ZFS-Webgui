#!/bin/bash
####################################################
poolname=$1
type=$2
disks="$3"
####################################################
zpool create $poolname $type $disks
exit