#!/bin/bash
#### install wine


echo "kurulacak***************************************************************"
mkdir chroot/tmp

cp wine.sh chroot/tmp/wine.sh
#run install
chroot chroot /tmp/wine.sh

