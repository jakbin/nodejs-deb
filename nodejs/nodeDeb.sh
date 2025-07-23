#!/bin/bash

# repo url:- https://github.com/jakbin/deb-scripts


version='v22.17.1'

if [ -f 'node-'$version'-linux-x64.tar.xz' ]; then
	echo "file node-$version-linux-x64.tar.xz already exits"
else
	wget 'https://nodejs.org/dist/'$version'/node-'$version'-linux-x64.tar.xz'
fi

tar -xvf node-$version-linux-x64.tar.xz
mkdir -p node-$version/usr
cp -r node-$version-linux-x64/* node-$version/usr

rm node-$version/usr/LICENSE
rm node-$version/usr/README.md

if [ -f 'control' ]; then
	echo "control file already exits"
else
	wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/nodejs/control'
fi

mkdir node-$version/DEBIAN
cp control node-$version/DEBIAN/
dpkg -b node-$version
