#!/bin/bash


#### meb sertifikası
#wget http://sertifika.meb.gov.tr/MEB_SERTIFIKASI.cer -O /tmp/MEB_SERTIFIKASI.cer
#openssl x509 -inform DER -in MEB_SERTIFIKASI.cer -out /tmp/MEB_SERTIFIKASI.crt
#cp /tmp/MEB_SERTIFIKASI.crt chroot/usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt
#chroot chroot update-ca-certificates

chroot chroot openssl x509 -inform DER -in /usr/local/share/ca-certificates/MEB_SERTIFIKASI.cer -out /usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt



chroot chroot update-ca-certificates -v


