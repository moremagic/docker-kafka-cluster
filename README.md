# docker-kafka-cluster

Kafka をクラスタ構成でローカル起動するDockerComposeです

# quick start

## Kafka PLAINTEXT + (AKHQ and kafka-ui)

暗号化しない Broker の起動手順です

`docker-compose up -d`

## Kafka SSL + (AKHQ)

SSL暗号化を有効にした Broker の起動手順です

```
$ ./secrets-tool/create-secrets.sh
$ docker-compose -f compose-ssl.yml up -d
```

## Kafka PLAINTEXT + OIDC client(Keycloak for AKHQ and kafka-ui)

暗号化しない Broker と OIDC 認証を有効にした (AKHQ, kafka-ui) の起動手順です

```
$ export DOCKER_HOST_IP=$(ifconfig en0 | awk '$1 == "inet" {print $2}')
$ docker-compose -f docker-compose-akhq-oidc.yml up -d
```

## [AKHQ](https://akhq.io/)

AKHQ には以下のようにアクセスします

http://localhost:18080


## [kafka-ui](https://docs.kafka-ui.provectus.io/overview/readme)

kafka-ui には以下のようにアクセスします

http://localhost:8081

### OIDC有効時のユーザーとパスワード
| user | password | [group](https://akhq.io/docs/configuration/authentifications/groups.html) |
----|----|----
| admin-user | admin | admin |
| reader-user | reader | reader |

# 資料

## SSL

https://docs.confluent.io/platform/current/kafka/authentication_ssl.html#encrypt-and-authenticate-with-tls  
https://www.linkedin.com/pulse/sslkafka-whats-manual-gernot-pfanner  
https://github.com/Pierrotws/kafka-ssl-compose  
https://akhq.io/docs/configuration/brokers.html#example-for-confluent-cloud  

