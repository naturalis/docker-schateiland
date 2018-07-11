docker-schateiland
====================

Docker compose file and docker file for running schateiland webserver

Persistent volumes
 - "./www:/var/www/html"  
   Webserver code and content
 - "./initdb:/docker-entrypoint-initdb.d"
   initdb 
 - "./db:/var/lib/mysql"
   persistent mysql volume

webserver runs on port 80

Contents
-------------
Dockerfile creates the naturalis/schateiland container



Instruction building image
-------------
No special instructions
```
docker build naturalis/schateiland:0.0.1 .
```

Instruction running docker-compose.yml
-------------

#### preparation
- Copy env.template to .env and adjust root password

````
docker-compose up -d
````

Usage
-------------

````


````

