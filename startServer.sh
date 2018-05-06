#!/bin/bash

rm -r /usr/local/lib/R/site-library/00LOCK-*

if [ "$FASTBOOT" != "false" ]; then
  sed -i "s|install_flyconnectome_all.R|install_flyconnectome_packages.R|" /loadScript.R
fi

Rscript /loadScript.R

Rscript /loadScript.R

rm -r /usr/local/lib/R/site-library/00LOCK-*

chmod -R 777 /usr/local/lib/R/site-library
chmod -R 777 /usr/lib/R/site-library

rm -r /usr/local/lib/R/site-library/00LOCK-*

tail -F --retry /var/log/shiny-server/*.log &

/usr/bin/shiny-server.sh 
