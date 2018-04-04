FROM rocker/shiny

RUN apt-get -y update && apt-get -y install git r-base libssl-dev libssh2-1-dev cmtk xvfb \
libcurl4-openssl-dev libx11-dev mesa-common-dev libglu1-mesa-dev libxml2-dev

RUN git clone https://github.com/jefferislab/NBLAST_on-the-fly.git /srv/shiny-server/NBLAST_on-the-fly

RUN chmod -R 777 /srv/

COPY bootScript.R /bootScript.R 

RUN Rscript /bootScript.R || :

