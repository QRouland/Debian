#!/bin/bash
echo
echo "Start -- SVNinstall -- Start"

echo -n "Installation Subversion : "

apt-get -y install subversion &>/dev/null

if [ $? -eq 0 ]; then 
	echo "OK"
else
	echo "NOK"
fi

echo "End -- SVNinstall -- End"
echo
