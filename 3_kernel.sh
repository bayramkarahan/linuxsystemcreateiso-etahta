#!/bin/bash
#### liquorix kernel
#curl https://liquorix.net/liquorix-keyring.gpg | chroot chroot apt-key add -
#echo "deb http://liquorix.net/debian testing main" > chroot/etc/apt/sources.list.d/liquorix.list
#chroot chroot apt-get update -y
#chroot chroot apt-get install linux-image-liquorix-amd64 -y
#chroot chroot apt-get install linux-headers-liquorix-amd64 -y

#### stock kernel 
chroot chroot apt-get update -y
chroot chroot apt-get install linux-image-amd64 -y
chroot chroot apt-get install linux-headers-amd64 -y
#chroot chroot apt-get install linux-headers-$(uname -r) -y
cp installer chroot/usr/bin/installer
cp faz chroot/usr/bin/faz
chmod a+s chroot/usr/bin/faz