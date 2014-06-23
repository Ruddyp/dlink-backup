/1/ Saisir dans le terminal :

    apt-get install ssh vim expect git tftpd-hpa telnet

/2/ On doit ensuite donner les droit au répertoire ou seront stockés les fichiers des
  configurations dans/srv/tftp.

 Saisir dans le terminal :
    
    chmod -R 777 /srv/tftp
    chown -R nobody /srv/tftp

Ensuite forker le projet de Ruddyp sur github :

    git clone https://github.com/Ruddyp/dlink-backup
    cd dlink-backup/

Faire le nécessaire pour avoir le droit d'écrire sur GitLab.

1-

    cd ~/.ssh
    ls -al

Regarde si vous avez déjà une clé ssh ( en général id_rsa.pub ou id_dsa.pub)
Si aucune clé n'est présente allez à l'étape 2 sinon allez à l'étape 3

2-Générer votre clé

    ssh-keygen -t rsa -C "your_email@example.com"

Ensuite suivez les instructions.

3-Copiez votre clé publique qui est dans /Users/you/.ssh/id_rsa.pub.(Sans laissez
d'espace/ligne blanche)
Ajoutez la ensuite sur GitHub

4- Testez si tout fonctionne en tapant:

   ssh -T git@github.com

Suivez les instructions et validez cette étape si votre username apparait.

Créer un fichier switch.list dans le répertoire dlink-backup/ mettez-y les paramètres
 de vos switchs comme ceci --> IP;Username;password;
_______________________________________________________________________________

    #switch.list

    10.10.10.20;user;pass;
    10.10.10.26;user;pass;
_______________________________________________________________________________

Créer votre fichier de configuration :

    cp switch.conf.ini switch.conf

Adaptez ensuite le fichier switch.conf suivant vos besoins.
Lancez la commande :

    vim switch.conf

Puis lancez la commande(en étant root) :

    ./switch.sh

Pour visualiser la config allez dans $backupdir et tapez :

    less $ip.cfg

