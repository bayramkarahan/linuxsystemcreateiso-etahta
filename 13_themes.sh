i#!/bin/bash
#### install themes


echo "açılış teması yapılandırılıyor"

#run install
chroot chroot apt install plymouth* -y
cp etahta.png chroot/usr/share/plymouth/themes/lines/debian.png
cp logo.png chroot/usr/share/plymouth/themes/lines/logo.png
cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/login/background.svg
cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/login/background-nologo.svg

cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/wallpaper/contents/images/1280x1024.svg
cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/wallpaper/contents/images/1600x1200.svg
cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/wallpaper/contents/images/1920x1080.svg
cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/wallpaper/contents/images/1920x1200.svg

cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/lockscreen/contents/images/1280x1024.svg
cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/lockscreen/contents/images/1600x1200.svg
cp duvar.svg chroot/usr/share/desktop-base/emerald-theme/lockscreen/contents/images/1920x1080.svg
cp duvar.svg chroot1920x1200.svg

chroot chroot plymouth-set-default-theme -R lines


chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
chroot chroot apt --fix-broken install -y
