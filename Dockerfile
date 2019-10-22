FROM debian:buster-slim as BuildContainer
RUN apt update && apt install wget -y
RUN mkdir /usr/src/ooklaserver
RUN wget https://install.speedtest.net/ooklaserver/ooklaserver.sh && chmod a+x ooklaserver.sh
RUN ./ooklaserver.sh install -f -i /usr/src/ooklaserver

FROM debian:buster-slim
EXPOSE 8080
EXPOSE 5060
RUN useradd -M -r -s /sbin/nologin -u 4711 ookla
COPY --chown=ookla --from=BuildContainer /usr/src/ooklaserver /srv/ooklaserver
USER ookla:ookla
WORKDIR /srv/ooklaserver
CMD ["/srv/ooklaserver/OoklaServer"]
