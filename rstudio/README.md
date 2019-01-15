# Instructions to add packages to the Docker container

## Add packages to `install.R`

Within the file `install.R` in rstudio/bioc3.8 or rstudio/bioc3.9,
just add the desired packages to install.R,

Just add new package after the comment at the end of the file. Install
only using the package `BiocManager`,
	
eg:

	BiocManager::install(c('package', 'package)) 
	
		
