#!/bin/bash
#################### environment setting
source ./1_init.sh
#################### createsystem
source ./2_createsystem.sh
#################### kernel install
source ./3_kernel.sh
#################### firmware install
source ./4_firmware.sh
#################### 17g install
##source ./5_17g.sh
#################### xorg install (gui)
source ./6_xorg.sh
#################### language settings (Turkish)
source ./7_language.sh
#################### packagex86_64 install
source ./8_package_x86_64.sh
#################### install osk keyboard
source ./9_keyboard.sh
#################### install debs
source ./10_debs.sh
#################### install wine
source ./11_wine.sh
#################### install wpsoffice
source ./12_office.sh
#################### install wpsoffice
source ./13_themes.sh
#################### Set root password
pass="live"
echo -e "$pass\n$pass\n" | chroot chroot passwd
#################### meb sertifikası
source ./18_sertifika.sh
#################### purge unmount clean command
source ./19_purge_unmount.sh
#################### create live iso
source ./20_liveiso.sh
