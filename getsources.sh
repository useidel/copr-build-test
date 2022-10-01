#!/usr/bin/bash

PATH=/usr/bin:/usr/sbin/
export PATH

cp *.spec $HOME/rpm/SPECS/

MYVER=`grep ^Version *.spec |awk '{print $2}'`

cd $HOME/rpm/SOURCES

wget -nd https://github.com/signalapp/Signal-Desktop/archive/refs/tags/v${MYVER}.tar.gz


