#!/bin/bash
#### install wpsoffice


echo "kurulacak***************************************************************"
mkdir chroot/tmp

cp wpsoffice.sh chroot/tmp/wpsoffice.sh

#run install
chroot chroot /tmp/wpsoffice.sh

