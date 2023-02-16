i#!/bin/bash
#### install themes


echo "açılış teması yapılandırılıyor"

#run install
chroot chroot apt install plymouth* -y
cp etap.png chroot/usr/share/plymouth/themes/lines/debian.png
cp logo.png chroot/usr/share/plymouth/themes/lines/logo.png

chroot chroot plymouth-set-default-theme -R lines


chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
chroot chroot apt --fix-broken install -y
