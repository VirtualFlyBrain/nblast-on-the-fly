#!/usr/bin/env Rscript
options(flycircuit.datadir="/home/shiny/.local/share/rpkg-flycircuit/data/")
options(rgl.useNULL=TRUE)
options(shiny.port=3838)
options(shiny.host="0.0.0.0")
if(!require("devtools")) install.packages("devtools", dependencies=TRUE)
if(!require("jsonlite")) install.packages("jsonlite", dependencies=TRUE)
if(!require("git2r")) devtools::install_github("ropensci/git2r", dependencies=TRUE)
if(!require("Rcpp")) install.packages("Rcpp", dependencies=TRUE)
if(!require("shiny")) install.packages("shiny", dependencies=TRUE)
if(!require("shinyURL")) devtools::install_github("aoles/shinyURL", dependencies=TRUE)
if(!require("ggplot2")) install.packages("ggplot2", dependencies=TRUE)
if(!require("downloader")) install.packages("downloader", dependencies=TRUE)
if(!require("rgl")) install.packages("rgl", dependencies=TRUE)
if(!require("rglwidget")) install.packages("rglwidget", dependencies=TRUE)
if(!require("shinyRGL")) install.packages("shinyRGL", dependencies=TRUE)
library('rgl')
rgl.useNULL()
if(!require("igraph")) install.packages("igraph", dependencies=TRUE)
if(!require("rmarkdown")) install.packages("rmarkdown", dependencies=TRUE)
devtools::install_github("natverse/elmr", dependencies=TRUE)
devtools::install_github("jefferis/nat", dependencies=TRUE)
devtools::install_github("jefferislab/nat.nblast", dependencies=TRUE)
tryCatch(
    expr = {
        devtools::source_gist("fdd1e5b6e009ff49e66be466a104fd92", filename = "install_flyconnectome_all.R")
        message("Successfully executed the install_flyconnectome_all call.")
    },
    error = function(e){
        message('Caught an error!')
        print(e)
    },
    finally = {
        message('All done, quitting.')
    }
) 
tryCatch(
    expr = {
        devtools::install_github("jefferis/flycircuit", dependencies=TRUE)
        message("Successfully executed the jefferis/flycircuit install.")
    },
    error = function(e){
        message('Caught an error!')
        print(e)
    },
    finally = {
        message('All done, quitting.')
    }
) 
tryCatch(
    expr = {
        devtools::install_github("jefferislab/nat.flybrains", dependencies=TRUE)
        message("Successfully executed the jefferislab/nat.flybrains install.")
    },
    error = function(e){
        message('Caught an error!')
        print(e)
    },
    finally = {
        message('All done, quitting.')
    }
) 
library('methods')
library(flycircuit)
tryCatch(
    expr = {
        allbyall=load_si_data("allbyallblastcanon_f9dc90ce5b2ffb74af37db1e3a2cb35b.desc")
        message("Successfully executed the load_si_data(allbyallblastcanon_f9dc90ce5b2ffb74af37db1e3a2cb35b.desc) call.")
    },
    error = function(e){
        message('Caught an error!')
        print(e)
    },
    finally = {
        message('All done, quitting.')
    }
) 
tryCatch(
    expr = {
        dps=load_si_data("dpscanon_f9dc90ce5b2ffb74af37db1e3a2cb35b.rds")
        message("Successfully executed the load_si_data(dpscanon_f9dc90ce5b2ffb74af37db1e3a2cb35b.rds) call.")
    },
    error = function(e){
        message('Caught an error!')
        print(e)
    },
    finally = {
        message('All done, quitting.')
    }
) 
tryCatch(
    expr = {
        apres16k.p0=load_si_data("apres16k.p0.rds")
        message("Successfully executed the load_si_data(apres16k.p0.rds) call.")
    },
    error = function(e){
        message('Caught an error!')
        print(e)
    },
    finally = {
        message('All done, quitting.')
    }
) 
library('nat')
tryCatch(
    expr = {
        nat.flybrains::download_jefferislab_registrations()
        message("Successfully executed the download_jefferislab_registrations call.")
    },
    error = function(e){
        message('Caught an error!')
        print(e)
    },
    finally = {
        message('All done, quitting.')
    }
) 

