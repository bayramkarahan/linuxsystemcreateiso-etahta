#!/bin/bash
#### install osk

apt --fix-broken install -y
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

dpkg -i --force-all /tmp/debs/*.deb



#wget -nc -O /tmp/check.deb http://depo.pardus.org.tr/etap/pool/main/e/eta-check-inputdevice/eta-check-inputdevice_0.2.6_amd64.deb
#wget -nc -O /tmp/gestemas.deb http://depo.pardus.org.tr/etap/pool/main/e/eta-gestemas/eta-gestemas_0.1.15_amd64.deb
#dpkg -i --force-all /tmp/check.deb
#dpkg -i --force-all /tmp/gestemas.deb



apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
apt --fix-broken install -y

apt-get remove evince -y
wget -nc -O /tmp/okularpdfreader.deb https://github.com/bayramkarahan/okularpdfreaderplugin/raw/master/okularpdfreader.deb
dpkg -i --force-all /tmp/okularpdfreader.deb


