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

Lancez la commande (ceci est un exemple) :

    ./backup.sh truc.list 10.10.10.20 /srv/tftp config_tmp
La commande récupère la configuration du/des switchs.

Utiliser plutôt le script switch.sh qui exécutera le script backup.sh 
et va push sur GitLab. 

    ./switch.sh

Note: Le fichier switch.sh est à modifié suivant vos besoins.

Pour visualiser la config allez dans config_tmp/ et tapez :

    less “Ip_switch”.cfg

Exemple: 
    less 10.10.10.20.cfg
