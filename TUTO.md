#!/bin/sh

/1/ Saisir dans le terminal :

    apt-get install tftpd

/2/	On doit ensuite créer le répertoire ou seront stockés les fichiers des configurations dans/srv/tftp.

 Saisir dans le terminal :

    mkdir /srv/tftp
    chmod -R 777 /srv/tftp
    chown -R nobody /srv/tftp

Les paquets à installer : ssh, vim, expect, git & xinetd
    apt-get install ssh vim expect git xinetd 

Ensuite chercher dlink-backup sur GitHub et forker le projet de Ruddyp. 
 git clone **url récuperée**

Créer un fichier “Nom_fichier”.list mettez-y les paramètre de vos switch comme ceci --> IP;Username;password;
_______________________________________________________________________________________________________________________________
Exemple: |             
_________|				fichier truc.list

10.10.10.20;user;pass;
10.10.10.26;user;pass;


_______________________________________________________________________________________________________________________________
Lancez la commande (ceci est un exemple) :
./backup.sh truc.list 10.10.10.20 /srv/tftp config_tmp


Pour visualiser la config allez dans config_tmp/ et tapez :
 vim “Ip_switch”.cfg

Exemple: vim 10.10.10.20.cfg
