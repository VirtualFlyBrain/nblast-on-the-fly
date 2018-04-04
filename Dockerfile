FROM rocker/shiny

VOLUME /data

RUN apt-get -y update && apt-get -qq install -y software-properties-common wget \
git gzip tar less curl libcurl4-openssl-dev libxml2-dev libx11-dev freeglut3 freeglut3-dev libglu1-mesa-dev \
libgl1-mesa-dev xvfb libcairo2-dev libmagick++-dev libpoppler-cpp-dev libwebp-dev libssh2-1-dev libreadline-dev cmtk \
libblas-dev liblapack-dev tree grep

RUN git clone https://github.com/jefferislab/NBLAST_on-the-fly.git /srv/shiny-server/NBLAST_on-the-fly

RUN chmod -R 777 /srv/

COPY bootScript.R /bootScript.R 
COPY loadScript.R /loadScript.R
COPY startServer.sh /startServer.sh

RUN chmod +x /startServer.sh

RUN Rscript /bootScript.R || :

CMD["/startServer.sh"]
