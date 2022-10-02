#!/bin/bash

git clone https://gitlab.com/ggggggggggggggggg/17g
cd 17g
mk-build-deps --install
debuild -us -uc -b
cd ..
cp 17g-installer_1.0_all.deb chroot/tmp

#chroot chroot dpkg -i /tmp/17g-installer_1.0_all.deb # dosya adını uygun şekilde yazınız.
#chroot chroot apt --fix-broken install -y
#chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.


cp installergui chroot/usr/bin/installergui
cp installergui.desktop chroot/etc/xdg/autostart/installergui.desktop
cp config.yaml chroot/lib/live-installer/configs/config.yaml
cp config_fullscreen.yaml chroot/lib/live-installer/configs/config_fullscreen.yaml

gcc -o config-yaml-copy --static config-yaml-copy.c
cp config-yaml-copy chroot/usr/bin/config-yaml-copy
chown root:root chroot/usr/bin/config-yaml-copy
chmod a+s chroot/usr/bin/config-yaml-copy
