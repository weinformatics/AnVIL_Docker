if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")
install.packages("devtools", repos="https://cran.rstudio.com")

library(BiocManager)

if(BiocManager::version() != "3.8"){
    BiocManager::install(version="3.8",
                         update=TRUE, ask=FALSE)
}

builtins <- c("Matrix", "KernSmooth", "mgcv")

for (builtin in builtins)
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        suppressWarnings(BiocManager::install(builtin,
                                              version="3.8",
                                              update=TRUE, ask=FALSE))


install.packages(c("bigrquery", "googleCloudStorageR"),
                 repos="http://cran.mtu.edu")

devtools::install_github("DataBiosphere/Ronaldo")
