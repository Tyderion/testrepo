#!/bin/bash
git clone git://git.samba.org/samba.git samba4
cd samba4
git checkout v4-
./configure --enable-debug --enable-selftest --$dir

make

make install

/usr/local/samba/bin/samba-tool domain provision
