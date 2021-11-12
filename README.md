# docker-kafka-cluster

kafka bloker をクラスタ構成でローカル起動するDockerComposeです

# quick start

`docker-compose up -d`


## Kafka ACL
https://docs.confluent.io/3.3.0/kafka/authorization.html
https://docs.confluent.io/ja-jp/platform/6.0.1/kafka/authorization.html#acl-concepts

### 現状
今の所以下のエラーが出る

```
# ACLの登録
kafka-acls \
    --bootstrap-server broker-1:9092 \
    --command-config /etc/kafka/secrets/admin-client.conf \
    --add \
    --allow-principal User:* \
    --allow-host bloker-1 \
    --allow-host bloker-2 \
    --allow-host bloker-3 \
    --operation read \
    --operation write \
    --topic hoge
    
    
     Error while executing ACL command: org.apache.kafka.common.errors.SecurityDisabledException: No Authorizer is configured on the broker.
 ```

```
kafka-acls --authorizer-properties zookeeper.connect=zookeeper:2181 --list

    Error while executing ACL command: KeeperErrorCode = InvalidACL for /kafka-acl
```

## AKHQ

http://localhost:8080

```
以下エラーで現在接続できず（ホスト名検証で引っかかってるよう）

Caused by: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```
