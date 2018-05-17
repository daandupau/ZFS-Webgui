Arguments

zfs-create.sh <disk-size> <zpool>/<zvol-name>
disk-size = number{K,M,G,T,P,Z}
zpool = value (storage-name)
zvol = value (zfs volume name)

zfs-destroy.sh <zpool/zvol-name>
zpool = value (storage-name)
zvol = value (zfs volume name)

zpool-create.sh <poolname> <type> <disks>
poolname = value (name of the storage array)
type = value (one of: mirror, raidz1, raidz2, raidz3)
disks = range (list of disks example: sda sdb sdc sdd

zpool-destroy.sh <poolname>
poolname = value (name of the storage array)

zpool-export.sh <poolname>
poolname = value (name of the storage array)

zpool-get.sh <poolname>
poolname = value (name of the storage array)

zpool-import.sh <poolname> <d>
poolname = value (name of the storage array)
d = int (0 or 1 (toggles direct disk assignment)

zpool-set.sh <poolname> <option> <value>
poolname = value (name of the storage array)
option = value (zpool config options)
value = value (zpool config option value)