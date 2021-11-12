#!/bin/bash

curl -Ls https://github.com/confluentinc/confluent-platform-security-tools/raw/master/kafka-generate-ssl-automatic.sh > kafka-generate-ssl-automatic.sh

cat <<EOF > Dockerfile.keytool
FROM openjdk:alpine
RUN apk upgrade --update-cache --available && \
    apk add openssl bash && \
    rm -rf /var/cache/apk/*

WORKDIR /work
EOF

docker build -f Dockerfile.keytool -t keytool .
docker run --env-file ./env.list \
           -v $(pwd):/work \
           -it --rm --user 1000 \
           keytool bash kafka-generate-ssl-automatic.sh

echo "<入力したkeystore用パスワード>" > kafka_keystore_creds
echo "<入力したtruststore用パスワード>" > kafka_truststore_creds
echo "<入力したsslkey用パスワード>" > kafka_sslkey_creds

# clean
rm kafka-generate-ssl-automatic.sh
rm Dockerfile.keytool

