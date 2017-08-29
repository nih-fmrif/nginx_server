#!bin/bash
# provide arguments: user, pass, file
PASSWORD="$2"
SALT="$(openssl rand 3)"
SHA1="$(printf "%s%s" "$PASSWORD" "$SALT" | openssl dgst -binary -sha1)"
printf "$1:%s" "$(printf "%s%s" "$SHA1" "$SALT" | base64)" > $3

