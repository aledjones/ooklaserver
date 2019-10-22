# ooklaserver-docker

Ookla Server for Linux/Unix as Docker container


## How to use?

Simply run the container:
```sh
docker run -p 8080:8080 -p 5060:5060 aledjones/ooklaserver
```
or use it in `docker-compose`:
```yaml
version: '3'
services:
  server:
  image: aledjones/ooklaserver
  restart: always
  ports:
    - 8080:8080
    - 5060:5060
```

## Planned features

- use ENV to initialize `OoklaServer.properties`
- provide volumes to mount custom certificates as LE doesn't properly work inside the container

## Register your server with Ookla

Please refer to the guide [How To Install & Submit Server](https://support.ookla.com/hc/en-us/articles/234578568-How-To-Install-Submit-Server).

Please be aware, that Ookla requires you to setup a fallback option with HTTP. Otherwise your server will not be listed. 

