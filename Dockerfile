# Generated by repro: do not edit by hand
# Please edit Dockerfiles in .repro/
FROM rocker/verse:4.1.3
ARG BUILD_DATE=2022-09-10
WORKDIR /home/rstudio
RUN apt-get update -y && apt-get install -y rsync
RUN tlmgr install collection-latexrecommended
RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site
RUN tlmgr install pgf preview libertine
RUN apt-get update -y && apt-get install -y git rsync curl inkscape
RUN install2.r --error --skipinstalled \ 
  ggplot2 \ 
  ggthemes \ 
  patchwork \ 
  showtext \ 
  svglite \ 
  tidyverse \ 
  tikzDevice \ 
  xaringanthemer
