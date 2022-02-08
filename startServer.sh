#!/bin/bash

rm -rf /usr/local/lib/R/site-library/00LOCK-*

if [ "$FASTBOOT" != "false" ]; then
  sed -i "s|install_flyconnectome_all.R|install_flyconnectome_packages.R|" /loadScript.R
fi

while true; do for file in /var/log/shiny-server/*.log; do if [ -e $file ]; then cat $file; fi; done; sleep 40; done &

Rscript /loadScript.R

cd /tmp/ && sleep 1m && wget http://localhost:3838/NBLAST_on-the-fly/ &

/usr/bin/shiny-server.sh 
