# docker-kafka-cluster

kafka bloker をクラスタ構成でローカル起動するDockerComposeです

# quick start

## PLAINTEXT

暗号化しない Broker の起動手順です

`docker-compose up -d`

## SSL

SSL暗号化を有効にした Broker の起動手順です

```
$ ./secrets-tool/create-secrets.sh
$ docker-compose -f docker-compose-ssl.yml up -d
```


# AKHQ

http://localhost:8080

# 資料

## SSL

https://docs.confluent.io/platform/current/kafka/authentication_ssl.html#encrypt-and-authenticate-with-tls  
https://www.linkedin.com/pulse/sslkafka-whats-manual-gernot-pfanner  
https://github.com/Pierrotws/kafka-ssl-compose  
https://akhq.io/docs/configuration/brokers.html#example-for-confluent-cloud  

