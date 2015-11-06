#!/bin/bash
echo
echo "Start -- SVNtest -- Start"

echo -n "SVNinstall : "
if [ $(dpkg-query -W -f='${Status}' subversion 2>/dev/null | grep -c "ok installed") -eq 1 ]
then
  echo "OK"
else
  echo "NOK"
fi

echo -n "SVNconfig :"
if test -f /home/svns/EC/.svn
then 
  echo "OK"
else
  echo "NOK"
fi

echo -n "SVN test utilisation :"
mkdir /home/svn_client1/
mkdir /home/svn_client2/

svn co file:///home/svns/EC /home/svn_client1/
svn co file:///home/svns/EC /home/svn_client2/

cd /home/svn_client1/
touch fichier_test
svn add fichier_test
svn commit -m ""

cd /home/svn_client2/
svn update

if [ -f "fichier_test" ]; then
	echo "OK"
else
	echo "NOK"
fi

cd /home/svn_client2/
rm fichier_test
svn commit -m ""

rm -r /home/svn_client1/
rm -r /home/svn_client2/

echo "End -- SVNtest -- End"
echo 

