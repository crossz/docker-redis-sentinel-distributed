FROM redis:3

MAINTAINER Cross Zheng (zhengxin@twitter.com)

ARG REQUIREPASS
ARG QUORUM

EXPOSE 26379

ADD sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf

ENV REQUIREPASS $REQUIREPASS
ENV SENTINEL_QUORUM $QUORUM
ENV SENTINEL_DOWN_AFTER 30000
ENV SENTINEL_FAILOVER 180000

COPY sentinel-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["sentinel-entrypoint.sh"]
