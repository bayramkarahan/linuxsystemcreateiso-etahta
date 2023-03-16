#!/bin/bash
#### xorg & desktop pkgs

chroot chroot apt-get install xorg xserver-xorg xinit xserver-xorg-input-multitouch xserver-xorg-input-evdev dbus-x11 -y
chroot chroot apt-get install slick-greeter lightdm lightdm-settings apparmor -y # giriş ekranı olarak lightdm yerine istediğinizi kurabilirsiniz.
#chroot chroot apt-get install system-config-printer system-config-printer-common cups -y

#### Install lightdm (for lxde and xfce only)
#chroot chroot apt-get install lightdm lightdm-gtk-greeter -y

#### Install lxde-gtk3
#echo "deb https://raw.githubusercontent.com/lxde-gtk3/binary-packages/master stable main" > chroot/etc/apt/sources.list.d/lxde-gtk3.list
#curl https://raw.githubusercontent.com/lxde-gtk3/binary-packages/master/dists/stable/Release.key | chroot chroot apt-key add -
#chroot chroot apt-get update
#chroot chroot apt-get install lxde-core xdg-utils -y

#### Install xfce
#chroot chroot apt-get update
#chroot chroot apt-get install xfce4 xfce4-goodies -y

#### Install gnome
#chroot chroot apt-get install gnome-core -y

#### Install cinnamon
chroot chroot apt-get update
chroot chroot apt-get install cinnamon cinnamon-desktop-environment nemo-fileroller cinnamon-l10n fonts-liberation inxi --no-install-recommends -y
#chroot chroot apt-get install mousepad -y
chroot chroot apt-get remove evince gnome-terminal chromium firefox-esr totem pidgin thunderbird --no-install-recommends -y
chroot chroot apt-get autoremove -y
#chroot chroot apt-get install okular -y
#chroot chroot apt-get install firefox-esr firefox-esr-l10n-tr firefox-esr-l10n-trs -y
#chroot chroot apt-get install cinnamon plank task-cinnamon-desktop -y

#### Install kde
#chroot chroot apt-get update
#chroot chroot apt-get install  kde-plasma-desktop plasma-desktop kde-config-screenlocker dolphin kwin-x11 qml-module-org-kde-newstuff desktop-base kscreen plasma-nm plasma-pa kate -y

#### etap greeter install
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
chroot chroot apt --fix-broken install -y

wget -O greeter.deb https://github.com/bayramkarahan/pardus-lightdm-greeter/releases/download/current/pardus-lightdm-greeter_0.0.4_all.deb
wget -O greeter-keyboard.deb  https://github.com/bayramkarahan/pardus-lightdm-greeter-keyboard/releases/download/current/pardus-lightdm-greeter-keyboard_1.0_all.deb
wget -O greeter-sshlogin.deb  https://github.com/bayramkarahan/pardus-lightdm-greeter-sshlogin/releases/download/current/pardus-lightdm-greeter-sshlogin_1.0_all.deb
wget -O greeter-qrcode.deb  https://github.com/bayramkarahan/pardus-lightdm-greeter-qrcode/releases/download/current/pardus-lightdm-greeter-qrcode_1.0_all.deb
wget -O greeter-ebaqr-ogretmen.deb  https://github.com/bayramkarahan/pardus-lightdm-greeter-ebaqr-ogretmen/releases/download/current/pardus-lightdm-greeter-ebaqr-ogretmen_1.0_all.deb

mv greeter.deb chroot/tmp
chroot chroot dpkg -i /tmp/greeter.deb # dosya adını uygun şekilde yazınız.
mv greeter-keyboard.deb chroot/tmp
chroot chroot dpkg -i /tmp/greeter-keyboard.deb # dosya adını uygun şekilde yazınız.
mv greeter-sshlogin.deb chroot/tmp
chroot chroot dpkg -i /tmp/greeter-sshlogin.deb # dosya adını uygun şekilde yazınız.
mv greeter-qrcode.deb chroot/tmp
chroot chroot dpkg -i /tmp/greeter-qrcode.deb # dosya adını uygun şekilde yazınız.
mv greeter-ebaqr-ogretmen.deb chroot/tmp
chroot chroot dpkg -i /tmp/greeter-ebaqr-ogretmen.deb # dosya adını uygun şekilde yazınız.

chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
