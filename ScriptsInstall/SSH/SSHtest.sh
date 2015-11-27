#!/bin/bash
echo
echo "Start -- SSHtest -- Start"

echo -n "SSHinstall : "
if [ $(dpkg-query -W -f='${Status}' openssh-server 2>/dev/null | grep -c "ok installed") -eq 1 ]
then
  echo "OK"
else
  echo "NOK"
fi

echo -n "SSH listen 22 : "
if netstat -an | grep ":22" | grep -q LISTEN
then
  echo "OK"
else
  echo "NOK"
fi

echo "End -- SSHtest -- end"
echo
