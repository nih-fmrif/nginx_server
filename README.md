# To build the container execute the following command from this directory:
docker build -t mynginx .

# To use the container
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




# some caveats
Data needs to be readable from the Docker image.
