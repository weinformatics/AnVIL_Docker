## Packages to install in R

if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")

if(BiocManager::version() != "3.8")
    BiocManager::install(version="3.8", update=TRUE, ask=FALSE)

BiocManager::install("devtools")

pkgs <- c(
    "IRdisplay","evaluate","pbdZMQ", "uuid",
    "reshape2", "bigrquery","googleCloudStorageR",
    "tidyverse",
    ## Jupyter kernal requirements
    "IRkernal/IRkernal", 
    "DataBiocsphere/Ronaldo"
    ## Add additional comma-seperated packages here
    )

BiocManager::install(pkgs, update=TRUE, ask=FALSE)

IRkernal::instasllspec(user=FALSE)
