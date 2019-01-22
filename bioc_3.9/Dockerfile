FROM rocker/r-devel

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

## Note in the rocker/r-devel image R-devel is symlinked to 'RD'
RUN RD -e 'install.packages("BiocManager", repos = "https://cran.rstudio.com")' \
	&& RD -e 'if(BiocManager::version() != "3.9") {BiocManager::install(version="3.9", update=TRUE, ask=FALSE)}'


