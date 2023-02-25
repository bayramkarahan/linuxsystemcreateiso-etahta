#!/bin/bash
set -e
config_item ()
{
    if [ -f /etc/default/grub ]; then
	. /etc/default/grub || return
	for x in /etc/default/grub.d/*.cfg; do
	    if [ -e "$x" ]; then
		. "$x"
	    fi
	done
    fi
    eval echo "\$$1"
}

## modify EFI path for GalliumOS
sed -i "s/EFI\/ubuntu\x00\x00\x00\x00/EFI\/galliumos\x00/" \
  /usr/lib/grub/x86_64-efi-signed/grubx64.efi.signed

case $1 in
    configure)
	bootloader_id="$(config_item GRUB_DISTRIBUTOR | tr A-Z a-z | \
			 cut -d' ' -f1)"
	if [ "$bootloader_id" ] && [ -d "/boot/efi/EFI/$bootloader_id" ]; then
	    /usr/share/grub/grub-check-signatures
	    grub-install --target=x86_64-efi --auto-nvram
	fi
	;;
esac


#### Install dependencies
if which apt &>/dev/null && [[ -d /var/lib/dpkg && -d /etc/apt ]] ; then
    apt-get update
    apt-get install curl mtools squashfs-tools grub-pc-bin grub-efi xorriso debootstrap  --no-install-recommends -y
    #grub-pc-bin grub-efi
#    # For 17g package build
#    apt-get install git devscripts equivs -y
fi
#### For 17g package build
apt-get install git devscripts equivs --no-install-recommends -y
#set -ex
#### Chroot create
mkdir chroot  # || true
##### For debian
#ln -s sid /usr/share/debootstrap/scripts/yirmibir

#debootstrap --arch=amd64 --no-merged-usr sid chroot https://deb.debian.org/debian
#echo 'deb http://packages.linuxmint.com/pool/' > chroot/etc/apt/sources.list

#debootstrap --arch=amd64 --no-merged-usr sid chroot https://deb.debian.org/debian
#echo 'deb https://deb.debian.org/debian sid main contrib non-free' > chroot/etc/apt/sources.list

debootstrap --arch=amd64 --no-merged-usr testing chroot https://deb.debian.org/debian
echo 'deb https://deb.debian.org/debian testing main contrib non-free non-free-firmware' > chroot/etc/apt/sources.list

#debootstrap --arch=amd64 --no-merged-usr stable chroot https://deb.debian.org/debian
#echo 'deb https://deb.debian.org/debian stable main contrib non-free' > chroot/etc/apt/sources.list

#debootstrap --arch=amd64 --no-merged-usr yirmibir chroot https://depo.pardus.org.tr/pardus
#echo 'deb https://depo.pardus.org.tr/pardus yirmibir main contrib non-free' > chroot/etc/apt/sources.list

#debootstrap --arch=amd64 --no-merged-usr ondokuz chroot https://19.depo.pardus.org.tr/etap
#echo 'deb https://19.depo.pardus.org.tr/etap ondokuz main contrib non-free' > chroot/etc/apt/sources.list

#### Fix apt & bind
# apt sandbox user root
echo "APT::Sandbox::User root;" > chroot/etc/apt/apt.conf.d/99sandboxroot
for i in dev dev/pts proc sys; do mount -o bind /$i chroot/$i; done
chroot chroot apt-get install gnupg --no-install-recommends -y

#### grub packages
#chroot chroot apt-get dist-upgrade -y
chroot chroot apt-get install grub-pc-bin grub-efi-ia32-bin grub-efi --no-install-recommends -y

#### live packages for debian/devuan
chroot chroot apt-get install live-config live-boot --no-install-recommends -y
echo "DISABLE_DM_VERITY=true" >> chroot/etc/live/boot.conf

#### Configure system
cat > chroot/etc/apt/apt.conf.d/01norecommend << EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

# Set sh as bash inside of dash (optional)
rm -f chroot/bin/sh
ln -s bash chroot/bin/sh

#### Remove bloat files after dpkg invoke (optional)
cat > chroot/etc/apt/apt.conf.d/02antibloat << EOF
#DPkg::Post-Invoke {"rm -rf /usr/share/locale || true";};
DPkg::Post-Invoke {"rm -rf /usr/share/man || true";};
DPkg::Post-Invoke {"rm -rf /usr/share/help || true";};
DPkg::Post-Invoke {"rm -rf /usr/share/doc || true";};
DPkg::Post-Invoke {"rm -rf /usr/share/info || true";};
EOF

##skel dizini kopyalanıyor
cp etc/ -rf chroot/
chmod 777 chroot/etc/boot.d/*
chmod 777 chroot/etc/rc.local
chmod 777 chroot/etc/dkms/no-autoinstall


cp usr/ -rf chroot/
cp opt/ -rf chroot/
#cp lib/ -rf chroot/

