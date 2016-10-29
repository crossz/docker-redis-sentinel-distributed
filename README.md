# The Sentinel image for Redis Distributed Nodes

This is the sentinel image, which works for the evironments with serveral redis master or slave nodes running, i.e. this image has to be woking along with https://hub.docker.com/r/crossz/redis-sentinel-distributed/


## Docker Compose template of Redis cluster

The tempalte defines the topology of the Redis cluster

```
version: '2'

services:
  sentinel:
    build: .
    environment:
      - REQUIREPASS=12345678
      - SENTINEL_QUORUM=1
      - CLIENTPORT=26479
      - MASTERPORT=6479
      - MASTERHOST=localhost
      - MASTERNAME=mymaster
    network_mode: "host"
    image: crossz/sentinel-redis-distributed

```

