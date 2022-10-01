#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

rpmdev-setuptree

MYVER=`grep ^Version *.spec |awk '{print $2}'`
MYHOME=`pwd`

echo "%_topdir	$MYHOME" > .rpmmacros

cp *.patch rpmbuild/SOURCES

cd rpmbuild/SOURCES

wget -nd https://github.com/signalapp/Signal-Desktop/archive/refs/tags/v${MYVER}.tar.gz


