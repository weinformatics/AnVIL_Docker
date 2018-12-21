FROM rocker/rstudio:3.5.1

MAINTAINER nitesh.turaga@roswellpark.org

# nuke cache dirs before installing pkgs; tip from Dirk E fixes broken img
RUN  rm -f /var/lib/dpkg/available && rm -rf  /var/cache/apt/*

# google-cloud-sdk
RUN apt-get update \
&& apt-get install -yq --no-install-recommends \
    gnupg \
    curl \
    lsb-release \
 && export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
 && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list \
 && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
 && apt-get update \
 && apt-get install -yq --no-install-recommends \
    google-cloud-sdk \
 && apt-get -y  install --fix-missing gdb libxml2-dev python-pip libz-dev libmariadb-client-lgpl-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ADD install.R /tmp/

RUN R -f /tmp/install.R && \
    echo "library(BiocManager)" > $HOME/.Rprofile


ENV RSTUDIO_PORT 8001
ENV RSTUDIO_HOME /etc/rstudio

ADD rserver.conf $RSTUDIO_HOME/rserver.conf

EXPOSE $RSTUDIO_PORT
