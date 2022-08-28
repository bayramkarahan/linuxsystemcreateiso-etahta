#!/bin/bash

#### Install dependencies
if which apt &>/dev/null && [[ -d /var/lib/dpkg && -d /etc/apt ]] ; then
    apt-get update
    apt-get install curl mtools squashfs-tools grub-pc-bin grub-efi xorriso debootstrap -y
#    # For 17g package build
#    apt-get install git devscripts equivs -y
fi
#### For 17g package build
apt-get install git devscripts equivs -y
#set -ex
#### Chroot create
mkdir chroot  # || true
##### For debian
debootstrap --arch=amd64 --no-merged-usr sid chroot https://deb.debian.org/debian
echo 'deb https://deb.debian.org/debian sid main contrib non-free' > chroot/etc/apt/sources.list


#### Fix apt & bind
# apt sandbox user root
echo "APT::Sandbox::User root;" > chroot/etc/apt/apt.conf.d/99sandboxroot
for i in dev dev/pts proc sys; do mount -o bind /$i chroot/$i; done
chroot chroot apt-get install gnupg -y

#### grub packages
#chroot chroot apt-get dist-upgrade -y
chroot chroot apt-get install grub-pc-bin grub-efi-ia32-bin grub-efi -y

#### live packages for debian/devuan
chroot chroot apt-get install live-config live-boot -y
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
