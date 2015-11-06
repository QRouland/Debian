#!/bin/bash
echo
echo "Start -- LAMPinstall -- Start"

echo -n "Installation LAMP : " 
apt-get install -y apache2 php5 libapache2-mod-php5 mysql-server mysql-client php5-mysql &>/dev/null

if [ $? -eq 0 ]; then 
	echo "OK"
else
	echo "NOK"
fi

echo "End -- LAMPinstall -- End"
echo
