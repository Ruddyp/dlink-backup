#!/bin/sh


list=$1
expect="expect"
tftp=$2
tftpdir=$3
backupdir=$4


if [ $# -ne 4 ]
then
     echo "Not enough arguments or too much arguments"
     echo "Syntax: <list> <IP> <tftp directories> <backup directories>"
     echo "Example: ./backup.sh random.list 10.10.10.20 /srv/tftp config_recup/"
     exit
fi



which $expect || echo "please install 'expect' and try again."
which $expect || exit 5
mkdir $backupdir

cat $list | while read a
do
    ip=$(echo $a | cut -f 1 -d ";")
    user=$(echo $a | cut -f 2 -d ";")
    pass=$(echo $a | cut -f 3 -d ";")

    # cfg extesion is fix for SNR
    config="${ip}.cfg"
    echo $ip
    touch $tftpdir/$config
    chmod -R 777 $tftpdir
    chown -R nobody $tftpdir

    $expect dlink.exp $ip $user $pass $config $tftp && cp $tftpdir/$config $backupdir

    rm -f $tftpdir/$config

    #sed -i -e '/create/,/disable/{ /create/b;/disable/b; s/.*/******/;}' /home/ruddy/dlink-backup/config_tmp/172.18.78.11.cfg
    #sed -ie 's///'    /home/ruddy/dlink-backup/config_tmp/172.18.78.11.cfg
    sed -i -e 's/'${pass}'/******/g' ${backupdir}/${ip}.cfg
done

