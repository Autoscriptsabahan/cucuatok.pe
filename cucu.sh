#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;

flag=0


echo


if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi
echo "Okey!!! We start install Panel Reseller Now "
read -n1 -r -p "Press Enter Key To Install ..."
echo 'UPDATE REPOSITORY'
apt-get update
echo 'INSTALL PACKAGE'
#source
source="http://cucuatok.pe.hu/reseller.sh"
apt-get --assume-yes install libxml-parser-perl
wget $source/mysql_secure.sh && chmod +x mysql_secure.sh && ./mysql_secure.sh
clear
echo 'REMOVE AND ADD NEW OBJECT'
useradd -m vps
mkdir -p /home/vps/public_html
chown -R mysql:mysql /var/lib/mysql/
chmod -R 755 /var/lib/mysql/
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "$source/nginx.conf"
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf "$source/vps.conf"
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
service php5-fpm restart
service nginx restart
clear
echo 'CREATE OCS PANEL'
git remote add origin https://github.com/llxxdd/OcsPanels.git
git pull origin master
clear
echo 'GIVE PERMISSION'
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
php5enmod mcrypt
rm -r /root/ocs
clear

#download
cd
rm reseller.sh
rm mysql.sh
rm mysql_secure.sh
rm -rf ~/.bash_history && history -c
clear

# install screenfetch
cd

#touch screenfetch-dev
cd
wget https://github.com/KittyKatt/screenFetch/archive/master.zip
apt-get install -y unzip
unzip master.zip
mv screenFetch-master/screenfetch-dev /usr/bin
cd /usr/bin
mv screenfetch-dev screenfetch
chmod +x /usr/bin/screenfetch
chmod 755 screenfetch
cd
echo "clear" >> .bash_profile
echo "screenfetch" >> .bash_profile
#wget -O screenfetch-dev "https://raw.githubusercontent.com/rizal180499/Auto-Installer-VPS/master/conf/screenfetch-dev"
#mv screenfetch-dev /usr/bin/screenfetch
#chmod +x /usr/bin/screenfetch
#echo "clear" >> .profile
#echo "screenfetch" >> .profile

echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "     Copyright 2017© Cucuatok.pe.hu"
echo -e "\e[0;36m    ----------------------------------------\e[0;0m"
clear
echo -e "\e[0;34m           SERVICE CONTACT NUMBER"
echo -e "\e[0;34m               +60175835809"
echo -e "\e[0;36m   =========================================\e[0;0m"       
echo " "
echo -e "\e[0;35m    >>>>> Login Panel By Your IP Only <<<<<\e[0;0m"
echo ""
echo "            Database Host: localhost"
echo ""
echo "            Database Name: OCS_PANEL"
echo ""
echo "            Database User: root"
echo ""
echo "            Database Pass: cucuatok"
echo ""
echo -e "\e[0;36m =============================================\e[0;0m"
echo -e "\e[0;31m PLEASE CONTACT ADMIN FOR FULL SETUP SCRIPT\e[0;0m"
echo " "
echo " "
echo "Do you want install webmin and openvpn ? "
read -n1 -r -p "Press Enter Key To Continue ..."
clear
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
ENABLE IPV4 AND IPV6

COMPLETE 1%
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
echo "
REMOVE SPAM PACKAGE


COMPLETE 10%
"
wget "http://www.dotdeb.org/dotdeb.gpg"
wget "http://www.webmin.com/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
UPDATE AND UPGRADE PROCESS 

PLEASE WAIT TAKE TIME 1-5 MINUTE
"
apt-get update;apt-get -y upgrade;apt-get -y install wget curl
echo "
INSTALLER PROCESS PLEASE WAIT


COMPLETE 100%
"
wget "http://www.dotdeb.org/dotdeb.gpg"
wget "http://www.webmin.com/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
UPDATE AND UPGRADE .................... 

PLEASE CONTACT ADMIN @CUCU_ATOK
"
apt-get update;apt-get -y upgrade;apt-get -y install wget curl
echo "
INSTALLER PROCESS PLEASE WAIT

TERIMA KASIH DEMO NOT FULL VERSION
"
# login setting
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells

cd

sed -i '$ i\screen -AmdS limit /root/limit.sh' /etc/rc.local

sed -i '$ i\screen -AmdS ban /root/ban.sh' /etc/rc.local

sed -i '$ i\screen -AmdS limit /root/limit.sh' /etc/rc.d/rc.local

sed -i '$ i\screen -AmdS ban /root/ban.sh' /etc/rc.d/rc.local

echo "0 0 * * * root /usr/local/bin/user-expire" > /etc/cron.d/user-expire

echo "0 0 * * * root /usr/local/bin/user-expire-pptp" > /etc/cron.d/user-expire-pptp


cat > /root/ban.sh <<END3

#!/bin/bash

#/usr/local/bin/user-ban

END3


cat > /root/limit.sh <<END3

#!/bin/bash

#/usr/local/bin/user-limit

END3


cd /usr/local/bin
wget"http://cucuatok.pe.hu/DEMO-ATOK"


cp /usr/local/bin/premium-script /usr/local/bin/menu


chmod +x /usr/local/bin/trial

chmod +x /usr/local/bin/user-add

chmod +x /usr/local/bin/user-aktif

chmod +x /usr/local/bin/user-ban

chmod +x /usr/local/bin/user-delete

chmod +x /usr/local/bin/user-detail

chmod +x /usr/local/bin/user-expire

chmod +x /usr/local/bin/user-limit

chmod +x /usr/local/bin/user-lock

chmod +x /usr/local/bin/user-login

chmod +x /usr/local/bin/user-unban

chmod +x /usr/local/bin/user-unlock

chmod +x /usr/local/bin/user-password

chmod +x /usr/local/bin/user-log

chmod +x /usr/local/bin/user-add-pptp

chmod +x /usr/local/bin/user-delete-pptp

chmod +x /usr/local/bin/alluser-pptp

chmod +x /usr/local/bin/user-login-pptp

chmod +x /usr/local/bin/user-expire-pptp

chmod +x /usr/local/bin/user-detail-pptp

chmod +x /usr/local/bin/bench-network

chmod +x /usr/local/bin/speedtest

chmod +x /usr/local/bin/ram

chmod +x /usr/local/bin/log-limit

chmod +x /usr/local/bin/log-ban

chmod +x /usr/local/bin/user-generate

chmod +x /usr/local/bin/user-list

chmod +x /usr/local/bin/diagnosa

chmod +x /usr/local/bin/premium-script

chmod +x /usr/local/bin/user-delete-expired

chmod +x /usr/local/bin/auto-reboot

chmod +x /usr/local/bin/log-install

chmod +x /usr/local/bin/menu

chmod +x /usr/local/bin/user-auto-limit

chmod +x /usr/local/bin/user-auto-limit-script

chmod +x /usr/local/bin/edit-port

chmod +x /usr/local/bin/edit-port-squid

chmod +x /usr/local/bin/edit-port-openvpn

chmod +x /usr/local/bin/edit-port-openssh

chmod +x /usr/local/bin/edit-port-dropbear

chmod +x /usr/local/bin/autokill

chmod +x /root/limit.sh

chmod +x /root/ban.sh

screen -AmdS limit /root/limit.sh

screen -AmdS ban /root/ban.sh

clear

echo "========================================"  | tee -a log-install.txt
echo "Service Autoscript Created By Cucu Atok "  | tee -a log-install.txt
echo "----------------------------------------"  | tee -a log-install.txt
echo "Website : http://Cucuatok.pe.hu."  | tee -a log-install.txt
echo "   Contact Number     : +60175835809     "  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "TOLONG DAFTAR JIKA NAK FULL SETUP"  | tee -a log-install.txt
echo "PLEASE  DAFTAR IP BERSAMA ADMIN"
echo "PLEASE  DAFTAR IP BERSAMA ADMIN"  | tee -a log-install.txt
echo "PLEASE  DAFTAR IP BERSAMA ADMIN"  | tee -a log-install.txt
echo "PLEASE  DAFTAR IP BERSAMA ADMIN"  | tee -a log-install.txt
echo "Timezone   : Asia/Kuala_Lumpur"  | tee -a log-install.txt
echo "SERVER   : [on]"   | tee -a log-install.txt
echo "DDOS-TORRENT  : [on]"   | tee -a log-install.txt
echo "VPS Restart: 12.00am"   | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "----------------------------------------"
echo "------Thank you script panel--------"
echo "==========================================="  | tee -a log-install.txt
echo "       TERIMA KASIH!-TYPE REBOOT"
echo "==========================================="  | tee -a log-install.txt
cat /dev/null > ~/.bash_history && history -c
