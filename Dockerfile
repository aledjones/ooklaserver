FROM alpine:latest AS builder
WORKDIR  /usr/src/ooklaserver
RUN set eux; \
    apk add --update --no-cache \
    wget \
    bash \
    libgcc \
    gcompat; \
    addgroup -S speedtest; \
    adduser -S speedtest -G speedtest -h /usr/src/ooklaserver -s /bin/bash;
USER speedtest
RUN set eux; \
    wget https://install.speedtest.net/ooklaserver/ooklaserver.sh && chmod a+x ooklaserver.sh; \
    ./ooklaserver.sh install -f -i /usr/src/ooklaserver;

FROM alpine:latest
WORKDIR  /srv/ooklaserver
COPY entrypoint /usr/bin
RUN set eux; \
    apk add --update --no-cache \
    curl \
    libgcc \
    gcompat; \
    addgroup -S speedtest; \
    adduser -S speedtest -G speedtest -h /srv/ooklaserver -s /bin/ash; \
    chmod a+x /usr/bin/entrypoint
HEALTHCHECK --interval=20s --timeout=10s --retries=5 CMD curl -sS 127.0.0.1:8080 || exit 1
USER speedtest
COPY --chown=speedtest:speedtest --from=builder /usr/src/ooklaserver .
ENTRYPOINT ["entrypoint"]
CMD ["/srv/ooklaserver/OoklaServer"]
