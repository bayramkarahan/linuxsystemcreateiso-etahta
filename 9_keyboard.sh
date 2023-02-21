#!/bin/bash
#### install osk


chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
echo "kurulacak***************************************************************"
chroot chroot apt install git wget gir1.2-gtk-3.0 console-setup python3-gi python3-pip usbutils tzdata python3-dev python3-pynput -y
chroot chroot apt install onboard -y

chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
#wget -O osk.deb  https://github.com/bayramkarahan/gtk-keyboard-osk/releases/download/current/osk_0.1.0_all.deb
#mv osk.deb chroot/tmp
#chroot chroot dpkg -i /tmp/osk.deb # dosya adını uygun şekilde yazınız.
#rm -rf /tmp/gtk-keyboard-osk

