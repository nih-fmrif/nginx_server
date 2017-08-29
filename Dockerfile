FROM nginx:alpine

ENV HTPASSWD='foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.'

WORKDIR /opt

RUN apk add --no-cache gettext
RUN mkdir -p /data /var/log/nginx /opt/settings

COPY launch.sh ./
COPY ./settings/auth.conf /opt/settings
COPY ./settings/auth.htpasswd /opt/settings
CMD ["./launch.sh"]
