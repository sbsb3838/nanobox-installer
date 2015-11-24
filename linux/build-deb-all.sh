#!/bin/bash -e
mkdir -p nanobox-bundle/opt/nanobox/share

# gzip docs
[ -f nanobox-bundle/usr/share/doc/nanobox-bundle/changelog ] && gzip -n --best nanobox-bundle/usr/share/doc/nanobox-bundle/changelog || true

# proper permissions
chmod 644 nanobox-bundle/opt/nanobox/share/virtualbox.deb
chmod 644 nanobox-bundle/opt/nanobox/share/vagrant.deb

chmod 644 nanobox-bundle/usr/share/doc/nanobox-bundle/changelog.gz
chmod 644 nanobox-bundle/usr/share/doc/nanobox-bundle/copyright

find nanobox-bundle -type d | xargs chmod 755
chmod 755 nanobox-bundle/DEBIAN/p*

# build package
fakeroot dpkg-deb --build nanobox-bundle
