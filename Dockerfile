FROM debian:buster-slim as BuildContainer
RUN apt update && apt install wget -y
RUN mkdir /usr/src/ooklaserver
RUN wget https://install.speedtest.net/ooklaserver/ooklaserver.sh && chmod a+x ooklaserver.sh
RUN ./ooklaserver.sh install -f -i /usr/src/ooklaserver

FROM debian:buster-slim
EXPOSE 8080
EXPOSE 5060

ENV OOKLASERVER_TCPPORTS 5060,8080
ENV OOKLASERVER_UDPPORTS 5060,8080
ENV OOKLASERVER_ALLOWEDDOMAINS *.ookla.com, *.speedtest.net
ENV OPENSSL_SERVER_CERTIFICATEFILE cert.pem
ENV OPENSSL_SERVER_PRIVATEKEYFILE key.pem

RUN useradd -M -r -s /sbin/nologin -u 4711 ookla
COPY --chown=ookla --from=BuildContainer /usr/src/ooklaserver /srv/ooklaserver
RUN mkdir -p /usr/local/bin
ADD ./bin /usr/local/bin
RUN chmod +x /usr/local/bin/*.sh
USER ookla:ookla
WORKDIR /srv/ooklaserver
ENTRYPOINT ["/usr/local/bin/run.sh"]
