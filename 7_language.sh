#!/bin/bash
#klavye için gerekli paket
chroot chroot apt-get install console-setup console-common console-data keyboard-configuration  -y

#### language settings (Turkish)
echo "tr_TR.UTF-8 UTF-8" > chroot/etc/locale.gen
echo "LANG=tr_TR.UTF-8" > chroot/etc/default/locale
echo "Europe/Istanbul" > chroot/etc/timezone
chroot chroot timedatectl set-timezone Europe/Istanbul || true
ln -s ../usr/share/zoneinfo/Europe/Istanbul chroot/etc/localtime
cat > chroot/etc/X11/xorg.conf.d/10-keyboard.conf << EOF
Section "InputClass"
Identifier "system-keyboard"
MatchIsKeyboard "on"
Option "XkbLayout" "tr"
Option "XkbModel" "pc105"
#Option "XkbVariant" "f"
EndSection
EOF
chroot chroot locale-gen
