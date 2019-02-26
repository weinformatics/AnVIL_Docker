FROM bioconductor/release_base2:latest

MAINTAINER nitesh.turaga@roswellpark.org

# Update apt-get
RUN apt-get update

# Additional software needed to get R/Bioc working
RUN apt-get install -y --no-install-recommends \

    ## This section installs tools for other software
    pkg-config \
    fortran77-compiler \
    byacc \
    automake \
    curl \

    ## This installs libraries
    libpng-dev \
    libnetcdf-dev \
    libhdf5-serial-dev \
    libfftw3-dev \
    libfftw3-doc \ ## FIXME: Investigate, as this needed only for documentation
    libopenbabel-dev \
##  libfftw3-3 \ ## FIXME: See if it duplicated libfftw3-dev
    libopenmpi-dev \
    libexempi3 \
    libxt-dev \
    libgdal-dev \
    libjpeg62-turbo-dev \
    libcairo2-dev \
    libtiff5-dev \
    libreadline-dev \
    libgsl2 \ ## FIXME : see if this should be libgsl2-dev
    ## libgsl0-dev \ ## FIXME : see if this is not needed because libgsl2-dev is avilable
    libgtk2.0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libhdf5-dev \
    libncurses-dev \
    libbz2-dev \
    libxpm-dev \
    liblapack-dev \
    libv8-3.14-dev \
    libperl-dev \
    libarchive-extract-perl \ ## FIXME: Are these tools or libs?
    libfile-copy-recursive-perl \ ## FIXME: Are these tools or libs?
    libcgi-pm-perl \ ## FIXME: Are these tools or libs?
    libdbi-perl \
    libdbd-mysql-perl \
    libgtkmm-2.4-dev \
    libxml-simple-perl \
    libmpfr-dev \
    libudunits2-dev \
    libmodule-build-perl \
    libapparmor-dev \
    libgeos-dev \
    libprotoc-dev \
    librdf0-dev \
    libmagick++-dev \
    libsasl2-dev \
    libpoppler-cpp-dev \
    libprotobuf-dev \
    libpq-dev \
    libsbml5 \

    ## Databases and other software
    sqlite \
    openmpi-bin \
    mpi-default-bin \
    openmpi-common \
    openmpi-doc \
    tcl8.5-dev \
    tk8.5-dev \ ## FIXME: is this redundant with tk-dev
    tk-dev \
    openjdk-8-jdk \
    imagemagick \
    tabix \
    ggobi \
    graphviz \
    protobuf-compiler \
    jags \

    ## Python libs
    python-yaml \
    python-mpi4py \

    ## Additional resources
    xvfb \
    xfonts-100dpi \
    xfonts-75dpi \
    biber \
    htop \ ## FIXME : Probably not needed
    tree  ## FIXME : Probably not needed


# Install sklearn and pandas on python
pip install sklearn ## FIXME: why are these installed with pip vs other python-yaml
pip install pandas
## pip install yaml ## FIXME : remove python-yaml
## pip install mpi4py ## FIXME  : remove python-mpi4py

# google-cloud-sdk
RUN apt-get install -yq --no-install-recommends \
    apt-utils \
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

## Clean and rm
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Env settings for RStudio
ENV RSTUDIO_PORT 8001

ENV RSTUDIO_HOME /etc/rstudio
ADD rserver.conf $RSTUDIO_HOME/rserver.conf
EXPOSE $RSTUDIO_PORT
