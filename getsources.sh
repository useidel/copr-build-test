#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

pwd
ls -al

cp *.spec rpm/SPECS/

MYVER=`grep ^Version *.spec |awk '{print $2}'`

cd rpm/SOURCES

wget -nd https://github.com/signalapp/Signal-Desktop/archive/refs/tags/v${MYVER}.tar.gz


