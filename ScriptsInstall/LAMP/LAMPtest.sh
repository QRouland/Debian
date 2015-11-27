#!/bin/bash
echo
echo "Start -- LAMPtest -- Start"

echo -n "Serveur Apache lancé : "
listeners=$(netstat -antp | grep apache2)
if [ "$listeners" != "" ]
then
	echo "OK"
else
	echo "NOK"
fi


#~ ls /etc/apache2/mods-available
echo -n "Connexion en localhost : "
rm *.html* >/dev/null 2>&1
wget localhost >/dev/null 2>&1
if [ -e "./index.html" ]
then
	echo "OK"
else
	echo "NOK"
fi
#~ more /etc/init.d/apache2/sites-available/default

echo -n "MYSQL lancé : "
listeners=$(netstat -at | grep mysql)
if [ "$listeners" != "" ]
then
	echo "OK"
else
	echo "NOK"
fi

echo -n "MYSQL lancé : "
connect=$(echo "" | mysql -u root --password="root" 2>/dev/null)
ok=$(echo $?)
if [ $ok -eq 0 ]
then
	echo "OK"

	echo -n "Nb de BDD : "
	nbdb=$(echo "SHOW DATABASES" | mysql -u root --password="root" | wc -w )

	if [ $nbdb -eq 5 ]
	then 
		echo "OK"
	else 
		echo "NOK"
	fi
else
	echo "NOK"
fi


echo "End -- LAMPtest -- End"
echo
