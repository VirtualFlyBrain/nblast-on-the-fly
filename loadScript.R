#!/usr/bin/env Rscript

.libPaths()
.libPaths( c( "/usr/local/lib/R/site-library") )
.libPaths( c( .libPaths(), "/usr/lib/R/library") )
.libPaths( c( .libPaths(), "/usr/lib/R/site-library") )
.libPaths( c( .libPaths(), "/usr/local/lib/opencpu/site-library") )
.libPaths( c( .libPaths(), "/usr/lib/opencpu/library") )
.libPaths( c( .libPaths(), "/usr/lib/opencpu/site-library") )
.libPaths()
options(flycircuit.datadir="/data")
options(rgl.useNULL=TRUE)
if(!require("devtools")) install.packages("devtools")
# this will install all the regular nat packages
devtools::source_gist("39a1182f726989db7e03", filename="install_all_nat.R")
# elmr will bring in all the other packages we need
devtools::install_github("jefferis/elmr", dependencies=TRUE)
message("Setting up flycircuit dataset including pre-computed NBLAST scores")
devtools::source_gist("bbaf5d53353b3944c090", filename = "FlyCircuitStartupNat.R")

message("Downloading flycircuit neurons for de novo NBLAST - this could take 15m to overnight")
library(flycircuit)
dps<-read.neuronlistfh("http://flybrain.mrc-lmb.cam.ac.uk/si/nblast/flycircuit/dpscanon.rds",
    localdir=getOption('flycircuit.datadir'))
remotesync(dps,download.missing = TRUE)
