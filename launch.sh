#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
envsubst < /opt/settings/auth.conf > /etc/nginx/conf.d/auth.conf
envsubst < /opt/settings/auth.htpasswd > /etc/nginx/auth.htpasswd

nginx -g "daemon off;"
