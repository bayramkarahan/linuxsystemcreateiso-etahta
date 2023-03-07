#!/bin/bash
#firmware-b43-installer firmware-b43legacy-installer firmware-bnx2x \
#firmware-ipw2x00 firmware-ivtv firmware-linux-free  firmware-zd1211 \

chroot chroot apt-get update
chroot chroot apt-get install \
firmware-ipw2x00 firmware-ivtv firmware-linux-free  firmware-zd1211 \
firmware-b43-installer firmware-b43legacy-installer firmware-bnx2x \
zd1211-firmware \
firmware-linux \
firmware-linux-nonfree \
firmware-netxen \
firmware-ralink \
firmware-realtek \
firmware-iwlwifi \
firmware-intelwimax \
firmware-atheros \
firmware-bnx2 \
firmware-libertas \
bluez-firmware \
firmware-brcm80211 \
firmware-amd-graphics \
firmware-cavium \
firmware-intel-sound \
firmware-misc-nonfree \
firmware-myricom \
firmware-qlogic \
firmware-samsung \
firmware-siano \
firmware-sof-signed \
firmware-ti-connectivity -y
chroot chroot apt --fix-broken install -y

chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

 # gcc güncelleniyor
chroot chroot apt install build-essential -y
chroot chroot apt-get install manpages-dev -y

