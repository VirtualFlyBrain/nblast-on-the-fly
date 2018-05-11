#!/bin/bash

rm -r /usr/local/lib/R/site-library/00LOCK-*

if [ "$FASTBOOT" != "false" ]; then
  sed -i "s|install_flyconnectome_all.R|install_flyconnectome_packages.R|" /loadScript.R
fi

Rscript /loadScript.R

rm -r /usr/local/lib/R/site-library/00LOCK-*

chmod -R 777 /usr/local/lib/R/site-library
chmod -R 777 /usr/lib/R/site-library

rm -r /usr/local/lib/R/site-library/00LOCK-*

while true; do for file in /var/log/shiny-server/*.log; do if [ -e $file ]; then cat $file; fi; done; sleep 1m; done &

Rscript /loadScript.R &

/usr/bin/shiny-server.sh 
