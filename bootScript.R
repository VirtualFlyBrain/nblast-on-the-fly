#!/usr/bin/env Rscript
.libPaths( c("/srv/shiny-server/NBLAST_on-the-fly/packrat/lib/x86_64-pc-linux-gnu/3.4.4/", .libPaths()) )
options(flycircuit.datadir="/data")
options(rgl.useNULL=TRUE)
if(!require("devtools")) install.packages("devtools")
# this will install all the regular nat packages
devtools::source_gist("39a1182f726989db7e03", filename="install_all_nat.R")
# elmr will bring in all the other packages we need
devtools::install_github("jefferis/elmr", dependencies=TRUE)
