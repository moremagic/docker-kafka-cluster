# docker-kafka-cluster

kafka bloker をクラスタ構成でローカル起動するDockerComposeです

# quick start

## PLAINTEXT

暗号化しない Broker と AKHQ の起動手順です

`docker-compose up -d`

## SSL

SSL暗号化を有効にした Broker と AKHQ の起動手順です

```
$ ./secrets-tool/create-secrets.sh
$ docker-compose -f docker-compose-ssl.yml up -d
```

## PLAINTEXT + AKHQ OIDC(keycloak)

暗号化しない Broker と OIDC 認証を有効にした AKHQ の起動手順です

```
$ export DOCKER_HOST_IP=$(ifconfig en0 | awk '$1 == "inet" {print $2}')
$ docker-compose -f docker-compose-akhq-oidc.yml up -d
```

# AKHQ(https://akhq.io/)

```
$ export DOCKER_HOST_IP=$(ifconfig en0 | awk '$1 == "inet" {print $2}')
$ open http://${DOCKER_HOST_IP}:8080
```

### OIDC有効時のユーザーとパスワード
| AKHQ user | password | [group](https://akhq.io/docs/configuration/authentifications/groups.html) |
----|----|----
| admin-user | admin_user | admin |
| reader-user | reader_user | reader |

# 資料

## SSL

https://docs.confluent.io/platform/current/kafka/authentication_ssl.html#encrypt-and-authenticate-with-tls  
https://www.linkedin.com/pulse/sslkafka-whats-manual-gernot-pfanner  
https://github.com/Pierrotws/kafka-ssl-compose  
https://akhq.io/docs/configuration/brokers.html#example-for-confluent-cloud  

