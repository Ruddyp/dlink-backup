#!/bin/sh


SCRIPT_DIRECTORY=${0%/*}
FULL_PATH_DIR=$(cd "$SCRIPT_DIRECTORY"; pwd)

# Read configuration file
. "$FULL_PATH_DIR/switch.conf"

# Check if expect is installed
which $expect || { echo "Please install 'expect' package and try again."; exit 5; }

# Create folders if required
if [ ! -d "$backupdir" ]
then
  mkdir "$backupdir"
fi


# loop
cat "$list" | while read -r line
do

    # If the line is empty, we pass.
    [ -z "$line" ] && continue

    ip=$(printf "%s\n" "$line" | cut -f 1 -d ";")
    user=$(printf "%s\n" "$line" | cut -f 2 -d ";")
    pass=$(printf "%s\n" "$line" | cut -f 3 -d ";")

    # cfg extesion is fix for SNR
    config="${ip}.cfg"
    echo "$ip"

    if [ ! -e "$tftpdir/$config" ]
    then
      touch "$tftpdir/$config"
    fi
    chmod -R 777 "$tftpdir"
    chown -R nobody: "$tftpdir"


    if $expect "$FULL_PATH_DIR/dlink.exp" "$ip" "$user" "$pass" "$config" "$tftp"
    then
        cp "$tftpdir/$config" "$backupdir"
    else
        echo "Upload failed."
        exit 1
    fi

    rm -f "$tftpdir/$config"
    
    # replace...
    sed -i -e '/create\saccount/p;/create\saccount/,+2d' \
           -e 's/^ username \(\w\+\) password .*/# username \1 password *******/' \
           -e 's/^M//g' \
           "${backupdir}/${ip}.cfg"

     # Commit new configurations and push to Gitlab

    cd "$backupdir"
    git add *cfg
    git commit -m "Configurations `date +%Y-%m-%d\ %H:%M`"
    git push origin master

done
