#!/bin/sh

# Fetch configurations from switches list
./backup.sh switch.list 172.18.78.90 /srv/tftp ../config_tmp

# Commit new configurations and push to Gitlab
cd ../config_tmp
git add *cfg
git commit -m "Configurations `date +%Y-%m-%d\ %H:%M`"
git push origin master

