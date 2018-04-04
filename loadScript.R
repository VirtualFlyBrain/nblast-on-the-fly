#!/usr/bin/env Rscript

options(flycircuit.datadir="/data")
options(rgl.useNULL=TRUE)
if(!require("devtools")) install.packages("devtools")
install_github("aoles/shinyURL")
install.packages(c("shiny","ggplot2", "downloader", "rglwidget"))
devtools::source_gist("fdd1e5b6e009ff49e66be466a104fd92", filename = "install_flyconnectome_all.R")

