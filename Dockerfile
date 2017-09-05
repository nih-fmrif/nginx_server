FROM nginx:alpine

RUN apk add --no-cache gettext
RUN mkdir -p /data /var/log/nginx /opt/settings

RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /opt
COPY ./settings/auth.conf /etc/nginx/conf.d/auth.conf
COPY ./settings/auth.htpasswd /etc/nginx
COPY ./settings/nginx.conf /etc/nginx/nginx.conf

COPY launch.sh ./
ENTRYPOINT ["/opt/launch.sh"]
