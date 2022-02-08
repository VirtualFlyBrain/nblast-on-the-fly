FROM rocker/shiny:3.6.3

ENV FASTBOOT=false
ENV DEBIAN_FRONTEND=noninteractive 
ENV APPLICATION_LOGS_TO_STDOUT=true
ARG BUILD_KEY
ENV GITHUB_PAT $BUILD_KEY

RUN apt-get -qq -y update --allow-releaseinfo-change && apt-get -qq install -f -y --no-install-recommends apt-utils && apt-get -qq install -y software-properties-common wget
RUN apt-get -qq install -f -y --no-install-recommends git gzip tar less curl libcurl4-gnutls-dev libxml2-dev libx11-dev freeglut3 freeglut3-dev libglu1-mesa-dev
RUN apt-get -qq install -f -y --no-install-recommends libgl1-mesa-dev 
RUN apt-get -qq install -f -y --no-install-recommends xvfb xauth libcairo2-dev 
RUN apt-get -qq install -f -y --no-install-recommends libmagick++-dev 
RUN apt-get -qq install -f -y --no-install-recommends libpoppler-cpp-dev libwebp-dev libssh2-1-dev
RUN apt-get -qq install -f -y --no-install-recommends cmtk libblas-dev liblapack-dev tree grep libssl-dev
RUN apt-get -qq install -f -y --no-install-recommends xserver-xorg-video-dummy x11-apps

RUN git clone https://github.com/jefferislab/NBLAST_on-the-fly.git /srv/shiny-server/NBLAST_on-the-fly

RUN chmod -R 777 /srv/

COPY buildScript.R /buildScript.R 
COPY loadScript.R /loadScript.R
COPY startServer.sh /startServer.sh

RUN chmod +x /startServer.sh

# RUN sed -i "s/server {/preserve_logs true;\nserver {/" /etc/shiny-server/shiny-server.conf \
# && cat /etc/shiny-server/shiny-server.conf


RUN rm -rf /usr/local/lib/R/site-library/00LOCK-* 

RUN rm -rf /usr/local/lib/R/site-library/00LOCK-*

USER shiny

RUN Rscript /buildScript.R || :
RUN Rscript /loadScript.R || :

USER root

RUN mkdir -p /home/shiny/.local/share
RUN chmod -R 777 /home/shiny/.local/share

CMD ["/startServer.sh"]
