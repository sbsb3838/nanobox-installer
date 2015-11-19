mkdir -p nanobox/opt/nanobox/bin

wget -O nanobox/opt/nanobox/bin/nanobox https://s3.amazonaws.com/tools.nanobox.io/cli/linux/amd64/nanobox
chmod 755 nanobox/opt/nanobox/bin/nanobox

# gzip docs
gzip --best nanobox/usr/share/man/man1/nanobox.1
gzip --best nanobox/usr/share/doc/nanobox/changelog

# proper permissions
chmod 644 nanobox/usr/share/man/man1/nanobox.1.gz
chmod 644 nanobox/usr/share/doc/nanobox/changelog.gz

find nanobox -type d | xargs chmod 755
chmod 755 nanobox/DEBIAN/p*

# build package
fakeroot dpkg-deb --build nanobox
