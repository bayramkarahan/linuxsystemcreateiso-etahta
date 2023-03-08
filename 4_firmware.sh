#!/bin/bash
      #firmware-ivtv firmware-ipw2x00 \
      #firmware-zd1211
      #firmware-b43-installer \
      #firmware-b43legacy-installer \
      #firmware-intel-sound zd1211-firmware firmware-sof-signed  firmware-siano firmware-myricom firmware-netxen firmware-qlogic firmware-cavium firmware-atheros \

chroot chroot apt-get install \
      firmware-amd-graphics \
      bluez-firmware \
      firmware-bnx2 \
      firmware-bnx2x \
      firmware-brcm80211 \
      firmware-iwlwifi \
      firmware-libertas \
      firmware-linux \
      firmware-linux-free \
      firmware-linux-nonfree \
      firmware-misc-nonfree \
      firmware-ralink \
      firmware-realtek \
      firmware-samsung \
      firmware-ti-connectivity -y

chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

 # gcc güncelleniyor
chroot chroot apt install build-essential -y
chroot chroot apt-get install manpages-dev -y
