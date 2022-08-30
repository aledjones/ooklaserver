# ooklaserver

Ookla Server for Linux/Unix as Docker container

![Docker](https://github.com/RootShell-coder/ooklaserver/actions/workflows/docker-publish.yml/badge.svg)

__forked from [aledjones/ooklaserver](https://github.com/aledjones/ooklaserver)__

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
    - 8080:8080
    - 5060:5060
    volumes:
    - certs:/home/ookla:ro

```


## Register your server with Ookla
Please refer to the guide: 

* [How To Install & Submit Server](https://support.ookla.com/hc/en-us/articles/234578568-How-To-Install-Submit-Server).

* [How do I enable HTTPS / TLS support](https://support.ookla.com/hc/en-us/articles/360001087752-How-do-I-enable-HTTPS-TLS-support)



_Please be aware, that Ookla requires you to setup a fallback option with HTTP. Otherwise your server will not be listed._



_Ookla_
_We are expanding the packet loss testing capabilities of the Speedtest Server Network by implementing User Datagram Protocol (UDP). If you’re currently using Transmission Control Protocol (TCP), we ask that you reconfigure your server to use UDP._
 
_By enabling UDP on your Speedtest Server, you will get packet capture test information that you would not get with TCP. To enable UDP Support on your Speedtest Server, perform the following actions: Ensure that firewall rules allow UDP through port 8080 through IPtables or through any FW protocols setup on the machine Please note: if there is any pop in the network path from client to server that blocks UDP traffic a packet capture test will not be performed and result in a N/A result for that datapoint Open OoklaServer.properties in a text editor Ensure that OoklaServer.udpPorts = 5060,8080 is uncommented (uncommented by default) Save OoklaServer.properties Restart the daemon Linux ./ooklaserver.sh restart Windows _

