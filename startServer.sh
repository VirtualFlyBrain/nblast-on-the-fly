#!/bin/bash

rm -r /usr/local/lib/R/site-library/00LOCK-*

Rscript /loadScript.R

rm -r /usr/local/lib/R/site-library/00LOCK-*

chmod -R 777 /usr/local/lib/R/site-library
chmod -R 777 /usr/lib/R/site-library

rm -r /usr/local/lib/R/site-library/00LOCK-*

/usr/bin/shiny-server.sh 
