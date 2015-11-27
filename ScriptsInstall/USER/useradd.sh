#!/bin/bash
users='ej ob jmi'

echo
echo "Start -- AddUsers -- Start"

 	
for u in $users
do
	echo -n "Ajout de $u : "
	adduser --home /home/ICEM1/${u} --gecos "Master 1 - ICE - 2015-2016" ${u} <<EOF
ice!2015
ice!2015
EOF
	if [ $? -eq 0 ]; then 
		echo "OK"
	else
		echo "NOK"
	fi	
	
	echo -n "Expirer le mot de passe de $u : "
 	passwd -e ${u} &>/dev/null

	if [ $? -eq 0 ]; then 
		echo "OK"
	else
		echo "NOK"
	fi	
done

echo "End -- AddUsers -- end"
echo
