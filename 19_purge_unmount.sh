#!/bin/bash
for item in $(ls chroot/usr/share/locale)
do
	if [ "$item" == "tr" ] || [ "$item" == "en" ] || [ "$item" == "tr_TR.UTF-8" ] || [ "$item" == "tr_TR.utf8" ] || [ "$item" == "tr_TR" ] || [ "$item" == "tr.UTF-8" ] || [ "$item" == "tr.utf8" ]
	then
		#rm -rf ./liste/$item
		echo "var" 1>/dev/null
	else
		rm -rf chroot/usr/share/locale/$item
	fi
done

rm -rf chroot/usr/share/applications/xinput_calibrator.desktop
#chroot chroot /bin/bash || true
### Remove sudo (optional)
#chroot chroot apt purge sudo -y
#chroot chroot apt remove thunar -y
#chroot chroot apt purge thunar -y
chroot chroot apt autoremove -y
apt update
apt install libdbus-glib-1-2 ---reinstall -y
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
