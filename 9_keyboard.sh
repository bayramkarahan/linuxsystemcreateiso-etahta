#!/bin/bash
#### install osk


chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
echo "kurulacak***************************************************************"
chroot chroot apt install git wget gir1.2-gtk-3.0 console-setup python3-gi python3-pip usbutils tzdata python3-dev -y
chroot chroot pip3 install pynput


cp keyboard.sh  chroot/tmp/keyboard.sh 
#run install
chroot chroot /tmp/keyboard.sh 
