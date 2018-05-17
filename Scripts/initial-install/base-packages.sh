#!/bin/bash
####################################################
pkg="dialog "

####################################################
echo installing base packages
yum update -y
yum install $pkg -y

dialog --title "ZFS-GUI" \
--yesno "welcome to the ZFS-GUI project, are you ready to install?" 7 60
response=$?
case $response in
   0) echo "lets go!";;
   1) exit;;
   255) echo "[ESC] key pressed.";;
esac

result() {
i=0
echo there are ${#arrayName[@]} options selected
while (( i < ${#arrayName[@]} ))
do
  echo $i ${arrayName[$i]} 
  i=$(( $i + 1 ))
done
}

cmd=(dialog --separate-output --keep-tite --checklist "Select packages to install:" 20 100 4)
options=(1 "ZFS" on
         2 "NFS-Ganesha" off
         3 "ISCSI" off
         4 "Glusterfs" off
)

choice=$("${cmd[@]}" "${options[@]}" 2>&1 > /dev/tty )

for answer in $choice
do
# make decsion 
case $answer in
    1) 
       arrayNum=${#arrayName[@]}
       arrayName[$arrayNum]="ZFS"
       ;;
    2) 
       arrayNum=${#arrayName[@]}
       arrayName[$arrayNum]="NFS" 
       ;;
    3) 
       arrayNum=${#arrayName[@]}
       arrayName[$arrayNum]="ISCSI"
       ;;
    4)
       arrayNum=${#arrayName[@]}
       arrayName[$arrayNum]="Glusterfs"
       ;;	
	
esac
done
result