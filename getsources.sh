#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

rpmdev-setuptree

MYVER=`grep ^Version *.spec |awk '{print $2}'`

cp *.patch /github/home/rpmbuild/SOURCES

cd /github/home/rpmbuild/SOURCES

wget -nd https://github.com/signalapp/Signal-Desktop/archive/refs/tags/v${MYVER}.tar.gz


