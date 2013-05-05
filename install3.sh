#!/bin/bash
domain="fiktiv.local"
echo "Configure kerberos"
mv /etc/krb5.conf /etc/krb.conf.bak
cp /usr/local/samba/share/setup/krb5.conf /etc/krb5.conf
sed -i.bak2 "s/${REALM}/$domain/" /etc/krb5.conf