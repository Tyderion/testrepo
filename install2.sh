#!/bin/bash
cd ~/samba4
git checkout v4-0-stable
./configure --enable-debug --enable-selftest --$dir

make

make install

/usr/local/samba/bin/samba-tool domain provision
