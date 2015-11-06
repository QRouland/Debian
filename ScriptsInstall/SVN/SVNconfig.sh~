#!/bin/bash
echo
echo "Start -- SVNconfig -- Start"

echo -n "Creation d'un depot svn EC partages : "

mkdir -p /home/svns/EC
svnadmin create --fs-type fsfs /home/svns/EC &>/dev/null

if [ $? -eq 0 ]; then 
	echo "OK"
else
	echo "NOK"
fi

echo "End -- SVNconfig -- End"
echo
