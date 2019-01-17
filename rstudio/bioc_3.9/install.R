if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")

if(BiocManager::version() != "3.9")
    BiocManager::install(version="3.9", update=TRUE, ask=FALSE)

BiocManager::install("devtools")

builtins <- c("Matrix", "KernSmooth", "mgcv")
pkgs <- c(
    builtins[!builtins %in% rownames(installed.packages())],
    "bigrquery", "googleCloudStorageR",
    "DataBiosphere/Ronaldo"
    ## Add additional comma-separated packages here
)
BiocManager::install(pkgs, update = TRUE, ask = FALSE)
