# The Sentinel for Redis Cluster Distributed

This image has to be woking along with https://hub.docker.com/r/crossz/redis-sentinel-distributed/


## Docker Compose template of Redis cluster

The tempalte defines the topology of the Redis cluster

```
version: '2'

services:
  sentinel:
    build: 
      context: sentinel
      args: 
        - PW=12345678
        - QUORUM=1
    environment:
      - CLIENTPORT=26479
      - MASTERPORT=6479
      - MASTERHOST=localhost
      - SENTINEL_DOWN_AFTER=5000
      - SENTINEL_FAILOVER=5000
    network_mode: "host"
    image: crossz/sentinel-redis-distributed

```

