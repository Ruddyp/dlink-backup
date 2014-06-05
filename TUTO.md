/1/ Saisir dans le terminal :

    apt-get install ssh vim expect git xinetd tftpd

/2/ On doit ensuite créer le répertoire ou seront stockés les fichiers des
  configurations dans/srv/tftp.

 Saisir dans le terminal :

    mkdir /srv/tftp
    chmod -R 777 /srv/tftp
    chown -R nobody /srv/tftp

Ensuite chercher dlink-backup sur GitHub et forker le projet de Ruddyp :

    git clone https://github.com/Ruddyp/dlink-backup

Créer un fichier “Nom_fichier”.list mettez-y les paramètre de vos switch comme
ceci --> IP;Username;password;
_______________________________________________________________________________

    #truc.list

    10.10.10.20;user;pass;
    10.10.10.26;user;pass;
_______________________________________________________________________________

Lancez la commande (ceci est un exemple) :

    ./backup.sh truc.list 10.10.10.20 /srv/tftp config_tmp

Pour visualiser la config allez dans config_tmp/ et tapez :

    vim “Ip_switch”.cfg

Exemple: vim 10.10.10.20.cfg
