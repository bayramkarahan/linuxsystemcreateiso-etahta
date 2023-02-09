#!/bin/bash
#### install wpsoffice


echo "kurulacak***************************************************************"
mkdir chroot/tmp

cp office.sh chroot/tmp/office.sh

#run install
chroot chroot /tmp/office.sh

