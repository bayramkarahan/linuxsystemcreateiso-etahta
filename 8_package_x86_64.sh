#!/bin/bash
chroot chroot apt-get update
chroot chroot apt-get install vlc evince gnome-terminal gnome-screenshot  gvfs-backends --no-install-recommends -y

#chroot chroot apt-get install chromium chromium-l10n  -y
chroot chroot apt-get install zip unzip sudo ark p7zip rar unrar file-roller --no-install-recommends -y
#chroot chroot apt-get install lsb-release systemsettings okular konsole -y

#Tab key parameters listing
chroot chroot apt-get install lsb-release systemsettings  bash-completion --no-install-recommends -y
chroot chroot apt-get install python3-tk --no-install-recommends -y

#chroot chroot apt-get install pcmanfm -y 
#chroot chroot apt-get install bash-completion synaptic gnome-themes-extra -y

#### Usefull stuff
chroot chroot apt-get install network-manager network-manager-gnome pulseaudio  pavucontrol  --no-install-recommends -y
chroot chroot apt-get install network-manager git make wget --no-install-recommends -y
#chroot chroot apt-get install xterm -y

# mpv 
chroot chroot apt-get install gtk3-nocsd e2fsprogs dosfstools qml-module-qt-labs-platform wpasupplicant ntfs-3g --no-install-recommends -y

#### e-ag
#chroot chroot apt install e-ag-client e-ag-x11client libnss3-tools -y
#chroot chroot apt remove xrdp -y
#chroot chroot apt install xrdp -y
#chroot chroot apt install e-ag-client e-ag-x11client -y
chroot chroot apt install usbutils libnss3-tools --no-install-recommends -y

chroot chroot apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
chroot chroot apt --fix-broken install -y


#printer server
#chroot chroot apt-get install cups* -y
#--no-install-recommends
#grub-pc-bin grub-efi efibootmgr linux-image-amd64
