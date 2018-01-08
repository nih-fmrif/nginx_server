# To build the container execute the following command from a clone of this repo:

	docker build -t mynginx .

# To use the container
Change the absolute path for the data directory as required: 

	docker run -v $PWD/log:/var/log/nginx -v /home/dsst/nndsp_mriqc_server/mriqc/reports:/data -v settings:/opt/settings -p 3002:3002  --rm -it  mynginx

# To make a new password:

A dockerfile for httpd-tools is contained in apache_tools

Build and run with:

	cd apache_tools
	docker build -t apache .
	cd ..
	docker run  -v $PWD/settings:/data --entrypoint /bin/sh --rm -it apache

Once in the container

	cd /data
	htpasswd -c auth.htpasswd username

The following might be helpful:

`https://www.digitalocean.com/community/tutorials/how-to-set-up-basic-http-authentication-with-nginx-on-centos-7`

# Original repo:
`https://hub.docker.com/r/beevelop/nginx-basic-auth`

# Example for use with singularity:

One can use the docker2singularity image to convert the nginx image to a singularity image and add some directories as bind points for [mounting host OS directories](http://singularity.lbl.gov/docs-mount) later:

	docker run -v /var/run/docker.sock:/var/run/docker.sock -v ~:/output --privileged -t --rm singularityware/docker2singularity -m "/gpfs /gs2 /gs3 /gs4 /gs5 /gs6 /gs7 /gs8 /spin1 /data /scratch /fdb /lscratch" mynginx

The following works for running the image (insert appropriate singularity image path)_:

	mkdir log temp_for_nginx
	singularity run -B log:/var/log/nginx -B temp_for_nginx/:/var/cache/nginx sing_image.img

# some caveats
Data needs to be readable from the Docker image.
