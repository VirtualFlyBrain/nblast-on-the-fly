FROM rocker/shiny

RUN apt-get -y install git r-base

RUN git clone https://github.com/jefferislab/NBLAST_on-the-fly.git /srv/shiny-server
