# ooklaserver

Ookla Server for Linux/Unix as Docker container

![Docker](https://github.com/RootShell-coder/ooklaserver/actions/workflows/docker-publish.yml/badge.svg)

## How to use?
`docker-compose`:
```yaml
version: '3.8'

volumes:
  certs:

services:
  server:
    container_name: speedtest
    hostname: your.host.name
    image: rootshellcoder/ooklaserver
    environment:
      OOKLASERVER_SSL_USELETSENCRYPT: 'false'
      OPENSSL_SERVER_CERTIFICATEFILE: /home/ookla/cert.pem
      OPENSSL_SERVER_PRIVATEKEYFILE: /home/ookla/key.pem
      OOKLASERVER_ALLOWEDDOMAINS: '*.ookla.com, *.speedtest.net'
      VIRTUAL_HOST: your.virtual.host
      TZ: Europe/Moscow
      HTTPS_METHOD: noredirect
    restart: unless-stopped
    ports:
    - 8080:8080/udp
    - 5060:5060/udp
    volumes:
    - certs:/home/ookla:ro

```


## Register your server with Ookla
Please refer to the guide:

* [How To Install & Submit Server](https://support.ookla.com/hc/en-us/articles/234578568-How-To-Install-Submit-Server).

* [How do I enable HTTPS / TLS support](https://support.ookla.com/hc/en-us/articles/360001087752-How-do-I-enable-HTTPS-TLS-support)



_Please be aware, that Ookla requires you to setup a fallback option with HTTP. Otherwise your server will not be listed._



_Ookla:_

_We are expanding the packet loss testing capabilities of the Speedtest Server Network by implementing User Datagram Protocol (UDP). If you’re currently using Transmission Control Protocol (TCP), we ask that you reconfigure your server to use UDP._
