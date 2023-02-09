#!/bin/bash
chroot chroot apt-get install bluez-firmware firmware-amd-graphics firmware-atheros \
      firmware-b43-installer firmware-b43legacy-installer firmware-bnx2 \
      firmware-bnx2x firmware-brcm80211 firmware-cavium firmware-intel-sound \
      firmware-intelwimax firmware-ipw2x00 firmware-ivtv firmware-iwlwifi \
      firmware-libertas firmware-linux firmware-linux-free firmware-linux-nonfree \
      firmware-misc-nonfree firmware-myricom firmware-netxen firmware-qlogic \
      firmware-ralink firmware-realtek firmware-samsung firmware-siano \
      firmware-ti-connectivity firmware-zd1211 zd1211-firmware firmware-sof-signed -y

chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

 # gcc güncelleniyor
chroot chroot apt install build-essential -y
chroot chroot apt-get install manpages-dev -y