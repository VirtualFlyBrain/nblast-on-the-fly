FROM rocker/shiny

ENV FASTBOOT=false

VOLUME /data

RUN apt-get -qq -y update && apt-get -qq install -y --no-install-recommends apt-utils && apt-get -qq install -y software-properties-common wget
RUN apt-get -qq -y update && apt-get -qq install -y git gzip tar less curl libcurl4-openssl-dev libxml2-dev libx11-dev freeglut3 freeglut3-dev libglu1-mesa-dev
RUN apt-get -qq -y update && apt-get -qq install -y libgl1-mesa-dev xvfb libcairo2-dev libmagick++-dev 
RUN apt-get -qq -y update && apt-get install -y libpoppler-cpp-dev libwebp-dev libssh2-1-dev libreadline-dev 
RUN apt-get -qq -y update && apt-get -qq install -y cmtk libblas-dev liblapack-dev tree grep libssl-dev

RUN git clone https://github.com/jefferislab/NBLAST_on-the-fly.git /srv/shiny-server/NBLAST_on-the-fly

RUN chmod -R 777 /srv/

COPY bootScript.R /bootScript.R 
COPY loadScript.R /loadScript.R
COPY startServer.sh /startServer.sh

RUN chmod +x /startServer.sh

RUN sed -i "s/server {/preserve_logs true;/nserver {/" /etc/shiny-server/shiny-server.conf \
&& cat /etc/shiny-server/shiny-server.conf


RUN Rscript /bootScript.R || :

CMD ["/startServer.sh"]
