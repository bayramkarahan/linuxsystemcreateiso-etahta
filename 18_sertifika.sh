#!/bin/bash

#### Run chroot shell
cp usr/ -rf chroot/
cp opt/ -rf chroot/
#cp lib/ -rf chroot/

mkdir chroot/opt/e-tahta
wget -O chroot/opt/e-tahta/e-tahta https://github.com/bayramkarahan/e-tahta-appimage/raw/master/e-tahta
chmod 777 chroot/opt/e-tahta/e-tahta

#### meb sertifikası
#wget http://sertifika.meb.gov.tr/MEB_SERTIFIKASI.cer -O /tmp/MEB_SERTIFIKASI.cer
#openssl x509 -inform DER -in MEB_SERTIFIKASI.cer -out /tmp/MEB_SERTIFIKASI.crt
#cp /tmp/MEB_SERTIFIKASI.crt chroot/usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt
#chroot chroot update-ca-certificates

chroot chroot openssl x509 -inform DER -in /usr/local/share/ca-certificates/MEB_SERTIFIKASI.cer -out /usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt
chroot chroot update-ca-certificates -v
