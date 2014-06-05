#!/bin/sh

# Annotation Change IP and backup directories for your own configuration
ip="172.18.78.90"
dst="../config_tmp"

# Fetch configurations from switches list
./backup.sh switch.list $ip /srv/tftp "$dst"

# Commit new configurations and push to Gitlab
cd "$dst"
git add *cfg
git commit -m "Configurations `date +%Y-%m-%d\ %H:%M`"
git push origin master
