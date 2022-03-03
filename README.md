# docker-kafka-cluster

kafka bloker をクラスタ構成でローカル起動するDockerComposeです  
MirrorMaker（MM1）の検証を可能にするためクラスタを2個起動します

# quick start

`docker-compose up -d`

## AKHQ

http://localhost:8080
http://localhost:8081

## MirrorMaker

```
docker run -ti --rm \
    --net=docker-kafka-cluster_default \
    -v $(pwd)/config:/opt/mirrormaker/config \
    confluentinc/cp-kafka:latest /bin/bash -c \
        "kafka-mirror-maker --consumer.config /opt/mirrormaker/config/mirrormaker-consumer.properties --producer.config /opt/mirrormaker/config/mirrormaker-producer.properties --whitelist topic-name"
```
