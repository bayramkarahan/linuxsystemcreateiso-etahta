#!/bin/bash
#### install osk

apt --fix-broken install -y
apt-get install -f -y # eksik bağımlılıkları tamamlaması için.

dpkg -i --force-all /tmp/debs/*.deb

apt-get install -f -y # eksik bağımlılıkları tamamlaması için.
apt --fix-broken install -y
