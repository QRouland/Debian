if ["$(id -u)" != 0 ]; then 
	echo "Le script doit etre lancé en root" 1>&2
	exit 1
fi

echo "Start -- Mise a jour des Paquets -- Start"
apt-get -y update &>/dev/null && apt-get -y upgrade &>/dev/null
echo "End --  Mise a jour des Paquets -- End"
echo

echo
echo "Start -- ajout des users -- Start"
exec ./USER/useradd.sh
echo "End --  ajout des users -- End"
echo

echo
echo "Start -- installation du serveur SSH -- Start"
exec ./SVN/SVNinstall.sh
exec ./SVN/SVNconfig.sh
exec ./SVN/SVNtest.sh
echo "End --  installation du serveur SSH -- End"
echo

echo
echo "Start -- installation du serveur SVN -- Start"
exec ./SSH/SSHinstall.sh
exec ./SSH/SSHconfig.sh
exec ./SSH/SSHtest.sh
echo "End --  installation du serveur SVN -- End"
echo

echo
echo "Start -- installation du serveur LAMP -- Start"
exec ./LAMP/LAMPinstall.sh
exec ./LAMP/LAMPconfig.sh
exec ./LAMP/LAMPtest.sh
echo "End --  installation du serveur LAMP -- End"
echo

