#!/bin/bash
certificateFile="/tmp/fatih.pem"
certificateName="fatihby" 
#/usr/local/share/ca-certificates
wget http://sertifika.meb.gov.tr/MEB_SERTIFIKASI.cer -O /tmp/MEB_SERTIFIKASI.cer
openssl x509 -inform DER -in /tmp/MEB_SERTIFIKASI.cer -out /tmp/MEB_SERTIFIKASI.crt
openssl x509 -in /tmp/MEB_SERTIFIKASI.crt -out /tmp/fatih.pem -outform PEM

for certDB in $(find  ~/.mozilla* -name "cert9.db")
do
  certDir=$(dirname ${certDB});
  #log "mozilla certificate" "install '${certificateName}' in ${certDir}"
  certutil -A -n "${certificateName}" -t "TCu,Cuw,Tuw" -i ${certificateFile} -d sql:${certDir}
done
