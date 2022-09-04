#!/bin/bash
#### Run chroot shell
cp usr/ -rf chroot/
cp opt/ -rf chroot/
wget -O /opt/e-tahta/e-tahta https://github.com/bayramkarahan/e-tahta-appimage/raw/master/e-tahta


#chroot chroot /bin/bash || true
### Remove sudo (optional)
#chroot chroot apt purge sudo -y
chroot chroot apt autoremove -y
#chroot chroot apt-get update
rm -rf chroot/etc/apt/sources.list.d/*
#### Clear logs and history
chroot chroot apt-get clean


rm -f chroot/root/.bash_history
rm -rf chroot/var/lib/apt/lists/*
rm -rf chroot/tmp/*

find chroot/var/log/ -type f | xargs rm -f

#### umount
for dir in dev dev/pts proc sys ; do
    while umount -lf -R chroot/$dir 2>/dev/null ; do true; done
done
