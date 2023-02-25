#!/bin/bash
#### install debs


echo "kurulacak***************************************************************"
mkdir chroot/tmp/debs
#wget -O chroot/tmp/debs/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#wget -O chroot/tmp/debs/brave.deb http://depo.pardus.org.tr/pardus/pool/non-free/b/brave-browser/brave-browser_1.45.133_amd64.deb

#wget -O chroot/tmp/debs/firefox-l10n.deb http://ftp.tr.debian.org/debian/pool/main/f/firefox/firefox-l10n-tr_109.0-1_all.deb
#wget -O chroot/tmp/debs/firefox.deb http://ftp.tr.debian.org/debian/pool/main/f/firefox/firefox_109.0-1_amd64.deb

cp debs/* chroot/tmp/debs/


cp debs.sh chroot/tmp/debs/debs.sh
#run install
chroot chroot /tmp/debs/debs.sh


#FXOS=linux64
#FXARCH=x86_64
#DEBARCH=amd64
#FXCHANNEL=firefox-latest-ssl
#FXDIR=firefox
            

#VERSION=${VERSION:-$(wget --spider -S --max-redirect 0 "https://download.mozilla.org/?product=${FXCHANNEL}&os=${FXOS}&lang=tr" 2>&1 | sed -n '/Location: /{s|.*/firefox-\(.*\)\.tar.*|\1|p;q;}')}
#FIREFOXPKG="https://download-installer.cdn.mozilla.net/pub/${FXDIR}/releases/${VERSION}/linux-${FXARCH}/tr/firefox-${VERSION}.tar.bz2"
#echo "Downloading Firefox $VERSION ..."
#wget --quiet --show-progress -O chroot/tmp/firefox-${VERSION}.tar.bz2 $FIREFOXPKG
#echo "Extracting files..."
#tar xvf chroot/tmp/firefox-$VERSION.tar.bz2
#rm chroot/tmp/firefox-$VERSION.tar.bz2
#mv ./firefox chroot/opt/
#chmod 755 chroot/opt/firefox
#apt update
#apt install libdbus-glib-1-2 --reinstall -y
