#!/bin/bash

#Genere les fichiers de l'utilisateur avec les droits associes
mkdir -p /home/ftpusers/"$1"
	cd /home/ftpusers/"$1"
	mkdir -p private public_html logs
	chown ftpuser *
	chown root .
	chgrp ftpgroup *
	chgrp root .
