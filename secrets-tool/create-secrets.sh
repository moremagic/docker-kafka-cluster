#!/bin/bash
##############################
# 参考； https://qiita.com/fkshom/items/cecb7e9b9aa342591813
##############################
cd `dirname $0`
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

# パスワードを「password」に固定
echo "<keystore用パスワード： password>"
echo password > kafka_keystore_creds
echo "<truststore用パスワード: password>"
echo password > kafka_truststore_creds
echo "<sslkey用パスワード: password>"
echo password > kafka_sslkey_creds

cp keystore/kafka.keystore.jks ../secrets/ssl
cp kafka_keystore_creds ../secrets/ssl
cp kafka_truststore_creds ../secrets/ssl
cp kafka_sslkey_creds ../secrets/ssl

# clean
rm kafka-generate-ssl-automatic.sh
rm Dockerfile.keytool

rm kafka_*
rm -r truststore
rm -r keystore
