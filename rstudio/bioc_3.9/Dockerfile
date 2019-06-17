FROM bioconductor/bioconductor_full:RELEASE_3_9

MAINTAINER nitesh.turaga@roswellpark.org

# google-cloud-sdk
RUN apt-get update \
	&& apt-get install -yq --no-install-recommends \
	apt-utils \
	curl \
	gnupg \
	lsb-release \
	&& export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
	&& echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
	&& apt-get update \
	&& apt-get install -yq --no-install-recommends \
	   google-cloud-sdk \
	&& apt-get -y  install --fix-missing \
	   gdb \
	   libxml2-dev \
	   python-pip \
	   libz-dev \
	   libmariadb-client-lgpl-dev

## Clean
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Rstudio settings

ENV RSTUDIO_PORT 8001
ENV RSTUDIO_HOME /etc/rstudio
ADD rserver.conf $RSTUDIO_HOME/rserver.conf
EXPOSE $RSTUDIO_PORT
