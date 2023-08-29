#!/bin/sh
echo $CLUSTER_ID > /tmp/clusterID

# Docker workaround: Remove check for KAFKA_ZOOKEEPER_CONNECT parameter
sed -i 's/dub ensure KAFKA_ZOOKEEPER_CONNECT.*/:/g' /etc/confluent/docker/configure
 
# Docker workaround: Remove check for KAFKA_ADVERTISED_LISTENERS parameter
sed -i 's/dub ensure KAFKA_ADVERTISED_LISTENERS.*/:/g' /etc/confluent/docker/configure
 
# Docker workaround: Ignore cub zk-ready
sed -i 's/cub zk-ready/echo ignore zk-ready/' /etc/confluent/docker/ensure
 
# KRaft required step: Format the storage directory with a new cluster ID
echo -e "\nkafka-storage format --ignore-formatted -t $(cat /tmp/clusterID) -c /etc/kafka/kafka.properties" >> /etc/confluent/docker/ensure
