#!/bin/sh

# Read configuration file
. ./switch.conf

# Check if expect is installed
which $expect || echo "please install 'expect' and try again."
which $expect || exit 5

# Create folders if required
if [ ! -d "$backupdir" ];then
  mkdir "$backupdir"
fi


# loop
cat "$list" | while read a
do

    if [ "$a" = "" ]
    then
        continue
    fi

    ip=$(echo $a | cut -f 1 -d ";")
    user=$(echo $a | cut -f 2 -d ";")
    pass=$(echo $a | cut -f 3 -d ";")

    # cfg extesion is fix for SNR
    config="${ip}.cfg"
    echo $ip

    if [ ! -d "$tftpdir/$config" ]; then
      touch "$tftpdir/$config"
    fi
    chmod -R 777 "$tftpdir"
    chown -R nobody "$tftpdir"
    

    $expect dlink.exp $ip $user $pass $config "$tftp" && cp "$tftpdir/$config" "$backupdir"

    rm -f "$tftpdir/$config"

    # replace...
    sed -i -e '/create\saccount/p;/create\saccount/,+2d' \
           -e 's/^ username \(\w\+\) password .*/# username \1 password *******/' \
           -e 's///g' \
	   "${backupdir}/${ip}.cfg" 

    
    # Commit new configurations and push to Gitlab
    cd "$backupdir"
    git add *cfg
    git commit -m "Configurations `date +%Y-%m-%d\ %H:%M`"
    git push origin master

done
