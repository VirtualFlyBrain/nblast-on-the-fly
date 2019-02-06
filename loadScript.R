#!/usr/bin/env Rscript
options(flycircuit.datadir="/home/shiny/.local/share/rpkg-flycircuit/data/")
options(shiny.port=3838)
options(shiny.host="0.0.0.0")

# install all required packages (updating github packages where possible)
source("/srv/shiny-server/NBLAST_on-the-fly/install_packages.R")

# not sure if we still need this (I think Rscript load methods now)
library('methods')

# download all data
source("/srv/shiny-server/NBLAST_on-the-fly/download_data.R")