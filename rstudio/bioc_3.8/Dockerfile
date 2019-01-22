FROM rocker/rstudio-stable:3.5.2

MAINTAINER nitesh.turaga@roswellpark.org

ENV RSTUDIO_PORT 8001
ENV RSTUDIO_HOME /etc/rstudio
ADD rserver.conf $RSTUDIO_HOME/rserver.conf
EXPOSE $RSTUDIO_PORT
