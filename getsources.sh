#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

mkdir -p rpm/SPECS rpm/SOURCES rpm/SRPMS

cp *.spec rpm/SPECS/
cp *.patch rpm/SOURCES

MYVER=`grep ^Version *.spec |awk '{print $2}'`

cd rpm/SOURCES

wget -nd https://github.com/signalapp/Signal-Desktop/archive/refs/tags/v${MYVER}.tar.gz


