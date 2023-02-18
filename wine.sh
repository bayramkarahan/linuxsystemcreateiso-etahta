#!/bin/bash
#### install wine

apt --fix-broken install -y
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

#apt --purge remove wine* -y
apt autoremove -y
#dpkg --add-architecture i386
apt update
#wget -nc -O /tmp/winehq.key https://dl.winehq.org/wine-builds/winehq.key &&  apt-key add /tmp/winehq.key
#echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" | tee /etc/apt/sources.list.d/winehq.list

wget -O /tmp/winehq.key https://dl.winehq.org/wine-builds/winehq.key
apt update
dpkg --add-architecture i386
apt install software-properties-common -y
apt-key add /tmp/winehq.key
echo 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main'> /etc/apt/sources.list.d/winehq.list
apt update
apt install --install-recommends winehq-devel -y
rm -rf /tmp/winehq.key

#apt install --install-recommends winehq-stable -y
#apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
#apt update
#dpkg-reconfigure wine-stable-amd64 wine-stable wine-stable-i386 -y

apt install libgtk3-nocsd0:i386 -y
apt install gnupg2 -y
##apt install software-properties-common -y
apt install winetricks -y 
apt install mono-complete -y

wget -nc -O /tmp/winemimetype.deb https://github.com/bayramkarahan/wineplugin/raw/master/winemimetype.deb
sudo dpkg -i --force-all /tmp/winemimetype.deb

wget -nc -O /tmp/wineshare.deb https://github.com/bayramkarahan/wineshare/raw/master/wineshare.deb
sudo dpkg -i --force-all /tmp/wineshare.deb


apt autoremove -y
apt autoclean -y
#rm -rf /etc/apt/sources.list.d/winehq.list
apt update
