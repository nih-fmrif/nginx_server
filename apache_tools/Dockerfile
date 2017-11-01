FROM    ubuntu:latest
RUN  apt-get update && apt-get install apache2 apache2-utils -y
RUN mkdir /data
EXPOSE  80

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]
