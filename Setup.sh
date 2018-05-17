#!/bin/bash
####################################################
scripts=Scripts\initial-install

####################################################
echo checking for root user
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else

$scripts\base-packages.sh
$scripts\zfs-epel.sh
  
 fi