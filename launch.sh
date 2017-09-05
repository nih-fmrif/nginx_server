#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
envsubst < /opt/settings/auth.conf > /etc/nginx/conf.d/auth.conf
cp /opt/settings/auth.htpasswd /etc/nginx

nginx -g "daemon off;"
