#!/bin/bash
#### install wine

apt --fix-broken install -y
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
wget -O /tmp/wps.deb http://depo.pardus.org.tr/etap/pool/non-free/w/wps-office/wps-office_10.1.0.6757pardus2_amd64.deb

#wget -O /tmp/wps.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/wps-office_11.1.0.11664.XA_amd64.deb
dpkg -i /tmp/wps.deb
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
apt --fix-broken install -y

wget -O /tmp/wps-tr.deb https://github.com/bayramkarahan/wps-office-tr-dil/raw/master/wps-tr.deb

#wget -O /tmp/wps.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/wps-office_11.1.0.11664.XA_amd64.deb
dpkg -i /tmp/wps-tr.deb
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
apt --fix-broken install -y
#cd /tmp
#git clone https://github.com/bayramkarahan/wps-office-tr-dil.git
#cp wps-office-tr-dil/* -rf /opt/
