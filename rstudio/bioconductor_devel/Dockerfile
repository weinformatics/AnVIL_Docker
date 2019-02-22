FROM bioconductor/devel_base2:latest

MAINTAINER nitesh.turaga@roswellpark.org

# Additional software needed to get R/Bioc working
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libpng-dev \
    libnetcdf-dev \
    libhdf5-serial-dev \  
    sqlite \
    libfftw3-dev \
    libfftw3-doc \
    libopenbabel-dev \
    libfftw3-3 \
    libfftw3-dev \
    pkg-config \
    xfonts-100dpi \
    xfonts-75dpi \
    libopenmpi-dev \
    openmpi-bin \
    python-mpi4py \
    mpi-default-bin \
    openmpi-common \
    libexempi3 \
    openmpi-doc \  
    libxt-dev \
    libgdal-dev \
    libjpeg62-turbo-dev \
    libcairo2-dev \
    libtiff5-dev \
    fortran77-compiler \
    libreadline-dev \  
    xvfb tcl8.5-dev \
    tk8.5-dev \
    libgsl2 \
    libgsl0-dev \
    libgtk2.0-dev \ 
    openjdk-8-jdk \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    htop \
    libgmp3-dev \
    imagemagick \
    libhdf5-dev \
    libncurses-dev \  
    libbz2-dev \
    libxpm-dev \
    liblapack-dev \
    libv8-3.14-dev \
    libperl-dev \
    libarchive-extract-perl \
    libfile-copy-recursive-perl \
    libcgi-pm-perl \
    tabix libdbi-perl \
    libdbd-mysql-perl \
    ggobi \
    libgtkmm-2.4-dev \  
    byacc \
    automake \
    graphviz \
    libxml-simple-perl \
    libmpfr-dev \  
    libudunits2-dev \
    tree \
    python-yaml \
    libmodule-build-perl \
    biber \  
    libprotobuf-dev \
    protobuf-compiler \
    libapparmor-dev \
    libgeos-dev \  
    libprotoc-dev \
    librdf0-dev \
    libmagick++-dev \
    libsasl2-dev \
    libpoppler-cpp-dev \
    jags \
    libpq-dev \
    tk-dev \
    libsbml5 \
    && apt-get clean \
	  && rm -rf /var/lib/apt/lists/*

# Install sklearn and pandas on python
pip install sklearn
pip install pandas


# google-cloud-sdk 
RUN apt-get update \
	&& apt-get install -yq --no-install-recommends \
	apt-utils \
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

# Env settings for RStudio
ENV RSTUDIO_PORT 8001
ENV RSTUDIO_HOME /etc/rstudio
ADD rserver.conf $RSTUDIO_HOME/rserver.conf
EXPOSE $RSTUDIO_PORT
