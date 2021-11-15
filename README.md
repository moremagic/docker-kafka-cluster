# docker-kafka-cluster

kafka bloker をクラスタ構成でローカル起動するDockerComposeです

# quick start

## Kafkaを起動する

`docker-compose up -d`


## Kafka ACL の設定を行う

- User:akhq topic:* Read/Write
- User:kafkaadmin topic:* group:* Read/Write // broker-broker間における接続元側が接続先に提示するアカウント kafka-admin

```
# ACLの登録

## Cluster User:kafkaadmin の topic:* に対しての Operation * を許可する
kafka-acls \
    --bootstrap-server broker-1:9092 \
    --command-config /etc/kafka/secrets/admin-client.conf \
    --add \
    --allow-principal User:kafkaadmin \
    --cluster *
    
kafka-acls \
    --bootstrap-server broker-1:9092 \
    --command-config /etc/kafka/secrets/admin-client.conf \
    --add \
    --allow-principal User:akhq \
    --cluster *
    
kafka-acls \
    --bootstrap-server broker-1:9092 \
    --command-config /etc/kafka/secrets/admin-client.conf \
    --add \
    --allow-principal User:akhq \
    --topic *


kafka-acls \
    --bootstrap-server broker-1:9092 \
    --command-config /etc/kafka/secrets/admin-client.conf \
    --list
 ```

### 参考資料
https://docs.confluent.io/3.3.0/kafka/authorization.html
https://docs.confluent.io/ja-jp/platform/6.0.1/kafka/authorization.html#acl-concepts
https://cwiki.apache.org/confluence/display/KAFKA/Kafka+Authorization+Command+Line+Interface


## ACL 設定を有効にする

1. broker を停止
2. docker-compose の `KAFKA_ALLOW_EVERYONE_IF_NO_ACL_FOUND: true` をコメントアウト
3. broker を起動



## AKHQ

http://localhost:8080

```
以下エラーで現在接続できず（ホスト名検証で引っかかってるよう）

Caused by: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```
