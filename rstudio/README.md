# Instructions to add packages to the Docker container

## Add packages to `install.R`

Within the file `install.R` in rstudio/bioc3.8 or rstudio/bioc3.9,
just add the desired packages to install.R,

Just add new package after the comment at the end of the file. Install
only using the package `BiocManager`,
	
eg:

	BiocManager::install(c('package', 'package)) 
	
To run on a local machine,

	docker run 
		-p 8001:8001 
		-v /AnVIL/AnVIL_buckets/bioc_release_volume/:/usr/local/lib/R/host-site-library 
		-e USER=rstudio anvil_bioc_3.8:release
