#!/bin/bash
#### install eğitim


echo "kurulacak***************************************************************"
mkdir chroot/tmp/debs
cp debs/* chroot/tmp/debs/
cp education.sh chroot/tmp/debs/education.sh
#run install
chroot chroot /tmp/debs/education.sh

