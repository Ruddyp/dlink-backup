/1/ Saisir dans le terminal :

    apt-get install ssh vim expect git xinetd tftpd

/2/ On doit ensuite créer le répertoire ou seront stockés les fichiers des
  configurations dans/srv/tftp.

 Saisir dans le terminal :

    mkdir /srv/tftp
    chmod -R 777 /srv/tftp
    chown -R nobody /srv/tftp

Ensuite forker le projet de Ruddyp sur github :

    git clone https://github.com/Ruddyp/dlink-backup

Créer un fichier switch.list mettez-y les paramètres de vos switchs comme
ceci --> IP;Username;password;
_______________________________________________________________________________

    #switch.list

    10.10.10.20;user;pass;
    10.10.10.26;user;pass;
_______________________________________________________________________________

Editer le fichier switch.conf.ini

    vim  switch.conf.ini

Adaptez ensuite le fichier switch.conf.ini suivant vos besoins.
Lancez la commande :

    cp switch.conf.ini switch.conf

Puis lancez la commande :

    ./switch.sh

Pour visualiser la config allez dans $backupdir et tapez :

    less $ip.cfg

