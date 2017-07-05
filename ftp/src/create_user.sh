#!/bin/bash

# $1 -> nom du site web
# $2 -> mot de passe hashé du site
# $3 -> sel du mdp
# $4 -> type de hash (1 pour le md5 etc...)

if [ -z $1 ]; then
	echo "Erreur : nom d'utilisateur requis"
else
	echo "Generation de l utilisateur $1 ..."
	mkdir -p /home/ftpusers/"$1"
	cd /home/ftpusers/"$1"
	mkdir -p private public_html logs
	chown ftpuser *
	chown root .
	chgrp ftpgroup *
	chgrp root .
	
	if [ ! -z $2 ]; then
		hashmdp="\$$4\$$3\$$2"
	else
		hashmdp=`openssl passwd -1 password`
	fi

	echo "$1:$hashmdp:1000:1000::/home/ftpusers/$1/./::::::::::::" >> /etc/pure-ftpd/passwd/pureftpd.passwd
	pure-pw mkdb /etc/pure-ftpd/pureftpd.pdb -f /etc/pure-ftpd/passwd/pureftpd.passwd
fi
