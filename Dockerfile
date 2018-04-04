FROM rocker/shiny

RUN apt-get -y update && apt-get -y install git r-base libssl-dev libssh2-1-dev mesa-common-dev cmtk xvfb

RUN rm -rf /srv/shiny-server 

RUN git clone https://github.com/jefferislab/NBLAST_on-the-fly.git /srv/shiny-server

RUN chmod -R 777 /srv/

COPY bootScript.R /bootScript.R 

RUN Rscript /bootScript.R || :

