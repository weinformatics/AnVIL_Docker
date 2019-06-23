# Instructions to run the docker image
	
To run on a local machine,

	docker run \
		-p 8001:8001 \
		-v /AnVIL/AnVIL_buckets/bioc_release_volume/:/usr/local/lib/R/host-site-library \
		-e USER=rstudio bioconductor/anvil-rstudio-bioc:tagname

The image will be served on https://localhost:8001
