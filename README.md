# ooklaserver-docker

Ookla Server for Linux/Unix as Docker container

![](https://github.com/aledjones/ooklaserver/workflows/Docker/badge.svg)

## How to use?

Simply run the container:
```sh
docker run -p 8080:8080 -p 5060:5060 aledjones/ooklaserver
```
or use it in `docker-compose`:
```yaml
version: '3'
volumes:
  certs:
services:
  server:
    image: aledjones/ooklaserver
    environment:
      #OOKLASERVER_TCPPORTS: '5060,8080'
      #OOKLASERVER_UDPPORTS: '5060,8080'
      OPENSSL_SERVER_CERTIFICATEFILE: /home/ookla/cert.pem
      OPENSSL_SERVER_PRIVATEKEYFILE: /home/ookla/key.pem
      #OOKLASERVER_ALLOWEDDOMAINS: '*.ookla.com, *.speedtest.net'
    restart: always
    ports:
    - 8080:8080
    - 5060:5060
    volumes:
    - certs:/home/ookla:ro
```

## Planned features

- use ENV to initialize `OoklaServer.properties`
- provide volumes to mount custom certificates as LE doesn't properly work inside the container

## Register your server with Ookla

Please refer to the guide [How To Install & Submit Server](https://support.ookla.com/hc/en-us/articles/234578568-How-To-Install-Submit-Server).

Please be aware, that Ookla requires you to setup a fallback option with HTTP. Otherwise your server will not be listed. 

