#!/bin/bash

rm -r /usr/local/lib/R/site-library/00LOCK-*

# no longer in use
# if [ "$FASTBOOT" != "false" ]; then
# fi

Rscript /loadScript.R

rm -r /usr/local/lib/R/site-library/00LOCK-*

chmod -R 777 /usr/local/lib/R/site-library
chmod -R 777 /usr/lib/R/site-library

rm -r /usr/local/lib/R/site-library/00LOCK-*

while true; do for file in /var/log/shiny-server/*.log; do if [ -e $file ]; then cat $file; fi; done; sleep 1m; done &

Rscript /loadScript.R


cd /tmp/ && sleep 1m && wget http://localhost:3838/NBLAST_on-the-fly/ &

/usr/bin/shiny-server.sh 
