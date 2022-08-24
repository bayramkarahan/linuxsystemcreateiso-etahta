#!/bin/bash
#### xorg & desktop pkgs

chroot chroot apt-get install xorg xserver-xorg xinit xserver-xorg-input-multitouch xserver-xorg-input-evdev dbus-x11 -y
chroot chroot apt-get install lightdm -y # giriş ekranı olarak lightdm yerine istediğinizi kurabilirsiniz.

#### Install lightdm (for lxde and xfce only)
#chroot chroot apt-get install lightdm lightdm-gtk-greeter -y

#### Install lxde-gtk3
#echo "deb https://raw.githubusercontent.com/lxde-gtk3/binary-packages/master stable main" > chroot/etc/apt/sources.list.d/lxde-gtk3.list
#curl https://raw.githubusercontent.com/lxde-gtk3/binary-packages/master/dists/stable/Release.key | chroot chroot apt-key add -
#chroot chroot apt-get update
#chroot chroot apt-get install lxde-core xdg-utils -y

#### Install xfce
#chroot chroot apt-get install xfce4 xfce4-goodies -y

#### Install gnome
#chroot chroot apt-get install gnome-core -y

#### Install kde
chroot chroot apt-get update
#chroot chroot apt-get install kde-plasma-desktop kwin-x11 kscreen plasma-nm plasma-pa kwin-x11 plasma-desktop kate dolphin qml-module-org-kde-newstuff -y
chroot chroot apt-get install  kde-plasma-desktop plasma-desktop dolphin kwin-x11 qml-module-org-kde-newstuff desktop-base kscreen plasma-nm plasma-pa kate -y

#### etap greeter install
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
chroot chroot apt --fix-broken install -y
wget https://github.com/qr-greeter/qr-greeter/releases/download/current/etap-greeter_0.1.0_all.deb 
mv etap-greeter_0.1.0_all.deb chroot/tmp
chroot chroot dpkg -i /tmp/etap-greeter_0.1.0_all.deb # dosya adını uygun şekilde yazınız.
chroot chroot apt --fix-broken install -y
chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
