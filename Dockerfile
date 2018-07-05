FROM nginx:alpine

RUN apk add --no-cache gettext
RUN mkdir -p /data /var/log/nginx /opt/settings /my_data /startup_data

RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /opt
COPY ./settings/meteor.conf /etc/nginx/conf.d/meteor.conf
COPY ./settings/auth.htpasswd /etc/nginx
RUN chown nginx:nginx /etc/nginx/auth.htpasswd
COPY ./settings/nginx.conf /etc/nginx/nginx.conf
COPY launch.sh ./
RUN chmod -R 777 /var/log/nginx /var/cache/nginx /opt /etc



ENTRYPOINT ["/opt/launch.sh"]
