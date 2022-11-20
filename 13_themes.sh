i#!/bin/bash
#### install themes


echo "açılış teması yapılandırılıyor"

#run install
chroot chroot apt install plymouth* -y
cp pardus.png chroot/usr/share/plymouth/themes/dolunay/pardus.png

chroot chroot plymouth-set-default-theme -R dolunay


chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
chroot chroot apt --fix-broken install -y
