#!/bin/bash
#### install debs


echo "kurulacak***************************************************************"
mkdir chroot/tmp/debs
wget -O chroot/tmp/debs/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#wget -O chroot/tmp/debs/brave.deb http://depo.pardus.org.tr/pardus/pool/non-free/b/brave-browser/brave-browser_1.45.133_amd64.deb
cp debs/* chroot/tmp/debs/


cp debs.sh chroot/tmp/debs/debs.sh
#run install
chroot chroot /tmp/debs/debs.sh

