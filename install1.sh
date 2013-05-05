#!/bin/bash
dir="/usr/local/samba"
host=`hostname`
pcname="vmADC"
domain="fiktiv.local"
interface="eth0"
gateway="192.168.5.1"
ip="192.168.5.10"
netmask="255.255.255.0"
echo "Configureing PC $host as $pcname.$domain"
newnet="iface $interface inet static\naddress $ip\nnetmask $netmask\ngateway $gateway\ndns-nameservers $ip\ndns-search $domain"
netregex=".*iface $interface inet dhcp.*"
echo "Regplacing $netregex with $newnet"
sed -i.bak "s/$netregex/$newnet/" /etc/network/interfaces
echo "Replacing $host with $pcname.$domain"
sudo cp /etc/hostname{,.bak}
sudo sh -c 'echo vmADC.fiktiv.local > /etc/hostname'
sed -i.bak "/127.0./ s/$host/$pcname.$domain $pcname/" /etc/hosts
ifdown eth0 && ifup eth0
echo "Installing samba4 prerequeistes"
#apt-get update
#apt-get install -y build-essential libacl1-dev libattr1-dev libblkid-dev libgnutls-dev libreadline-dev python-dev python-dnspython gdb pkg-config libpopt-dev libldap2-dev dnsutils libbsd-dev attr krb5-user docbook-xsl libcups2-dev libncurses5-dev git

#git clone git://git.samba.org/samba.git samba4
#cd samba4
#./configure --enable-debug --enable-selftest --$dir

#make

#make install

#/usr/local/samba/bin/samba-tool domain provision
