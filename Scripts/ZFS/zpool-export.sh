#!/bin/bash
####################################################
poolname=$1
####################################################
zpool export $poolname
exit