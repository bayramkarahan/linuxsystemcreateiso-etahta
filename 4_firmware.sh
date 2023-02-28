#!/bin/bash
chroot chroot apt-get install firmware-* -y

chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

 # gcc güncelleniyor
chroot chroot apt install build-essential -y
chroot chroot apt-get install manpages-dev -y
