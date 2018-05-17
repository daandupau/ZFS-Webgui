#!/bin/bash
####################################################
poolname=$1
type=$2
value=$3
####################################################
zpool set $poolname $type $value
exit