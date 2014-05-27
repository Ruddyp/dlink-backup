#!/bin/sh
list="default.list"
expect="expect"
tftp="172.18.78.80"
tftpdir="/srv/tftp/"
backupdir="configs_tmp/"


which $expect || echo "please install 'expect' and try again."
which $expect || exit 5
mkdir $backupdir

cat $list | while read a
do
    ip=$(echo $a | cut -f 1 -d ";")
    user=$(echo $a | cut -f 2 -d ";")
    pass=$(echo $a | cut -f 3 -d ";")

    # cfg extesion is fix for SNR
    config="$ip.cfg"
    echo $ip
    touch $tftpdir/$config
    chmod -R 777 $tftpdir
    chown -R nobody $tftpdir

    $expect dlink.exp $ip $user $pass $config $tftp && cp $tftpdir/$config $backupdir

    rm -f $tftpdir/$config
done

