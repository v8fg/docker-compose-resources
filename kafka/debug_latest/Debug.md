# Kafka image debug

## docker-compose.yml

```yml
version: "3"
services:
  kafka:
    image: bitnami/kafka:latest
    ports:
      - "9092:9092"
      - "9093:9093"
    # volumes:
      # - "kafka_data:/bitnami"
    # setting entrypoint
    entrypoint: /bin/sleep infinity
    environment:
    - BITNAMI_DEBUG=yes
    # Your config below
    - KAFKA_ENABLE_KRAFT=yes
    - KAFKA_CFG_PROCESS_ROLES=broker,controller
    - KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER
    - KAFKA_CFG_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:19093
    - KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,CONTROLLER:PLAINTEXT
    - KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=1@127.0.0.1:19093
    - ALLOW_PLAINTEXT_LISTENER=yes
    - KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://127.0.0.1:9092
    - KAFKA_CFG_BROKER_ID=1

# volumes:
#   kafka_data:
#     driver: local
```

## run and debug

- `docker-compose up`
- `docker-compose exec kafka bash`
  - `/opt/bitnami/scripts/kafka/entrypoint.sh /opt/bitnami/scripts/kafka/run.sh`
