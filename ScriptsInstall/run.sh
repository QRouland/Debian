if ["$(id -u)" != 0 ]; then 
	echo "Le script doit etre lancé en root" 1>&2
	exit 1
fi

echo "Start -- Mise a jour des Paquets -- Start"
apt-get -y update && apt-get -y upgrade
echo "End --  Mise a jour des Paquets -- End"
echo

echo
echo "Start -- ajout des users -- Start"
sh ./USER/useradd.sh
echo "End --  ajout des users -- End"
echo

echo
echo "Start -- installation du serveur SSH -- Start"
sh ./SVN/SVNinstall.sh
sh ./SVN/SVNconfig.sh
sh ./SVN/SVNtest.sh
echo "End --  installation du serveur SSH -- End"
echo

echo
echo "Start -- installation du serveur SVN -- Start"
sh ./SSH/SSHinstall.sh
sh ./SSH/SSHconfig.sh
sh ./SSH/SSHtest.sh
echo "End --  installation du serveur SVN -- End"
echo

echo
echo "Start -- installation du serveur LAMP -- Start"
sh ./LAMP/LAMPinstall.sh
sh ./LAMP/LAMPconfig.sh
sh ./LAMP/LAMPtest.sh
echo "End --  installation du serveur LAMP -- End"
echo
