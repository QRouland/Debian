#!/bin/bash
echo
echo "Start -- SSHinstall -- Start"

echo -n "Intallation SSH :" 
apt-get install -y openssh-server &>/dev/null

if [ $? -eq 0 ]; then 
	echo "OK"
else
	echo "NOK"
fi

echo "End -- SSHinstall -- End"
echo
