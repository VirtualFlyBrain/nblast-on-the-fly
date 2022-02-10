#!/bin/bash

rm -rf /usr/local/lib/R/site-library/00LOCK-*

if [ "$FASTBOOT" != "false" ]; then
  sed -i "s|install_flyconnectome_all.R|install_flyconnectome_packages.R|" /loadScript.R
fi

while true; do for file in /var/log/shiny-server/*.log; do if [ -e $file ]; then echo "${file}:"; cat -n $file; fi; done; sleep 40; done &


chmod -R 777 /usr/local/lib/R/site-library
chmod -R 777 /home/shiny/.local
rm -r /usr/local/lib/R/site-library/00LOCK-*

sudo GITHUB_PAT=$GITHUB_PAT -u shiny Rscript /loadScript.R

rm -r /usr/local/lib/R/site-library/00LOCK-*
chmod -R 777 /home/shiny/.local

cd /tmp/ && sleep 1m && wget http://localhost:3838/NBLAST_on-the-fly/ &

/usr/bin/shiny-server.sh 
