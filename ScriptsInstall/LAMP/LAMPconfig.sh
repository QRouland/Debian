#!/bin/bash
echo
echo "Start -- LAMPconfig -- Start"

echo -n "Activer le mod userdir : "
a2enmod userdir

if [ $? -eq 0 ]; then 
	echo "OK"
else
	echo "NOK"
fi

echo -n "Ajout phpinfo : "
rm -f /var/www/index.html
echo "<?phpinfo(); ?>" >> /var/www/index.php

if [ $? -eq 0 ]; then 
	echo "OK"
else
	echo "NOK"
fi

echo "End -- LAMPconfig -- end"
echo
