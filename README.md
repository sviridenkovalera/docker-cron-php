# Ubuntu(22.04) + Apache + PHP 8.2 + Ioncube x86-64

Webroot: /var/www/html

User/Group: www-data:www-data(33:33)

Modules:
   - bcmath
   - curl
   - dom
   - enchant
   - gd
   - gmp
   - iconv
   - imap
   - intl
   - mbstring
   - mcrypt
   - mysqli
   - mysqlnd
   - opcache
   - pdo
   - phar
   - pspell
   - snmp
   - soap
   - sockets
   - tidy
   - xmlreader
   - xmlrpc
   - xmlwriter
   - xsl
   - zip

## RUN


File `./myjob`
```txt
* * * * * www-data /usr/bin/php -r 'echo "Hello";' >> /proc/1/fd/1 2>> /proc/1/fd/2

```


```sh
    $ docker run -it --rm -v "./src/:/var/www/html" -v "./myjob/:/etc/cron.d/myjob" --platform linux/amd64 cowrvalera/docker-cron-php:v1.0.0
```

## Examples(docker-compose.yaml)

```yaml
version: '3.1'

services:
  web:
    image: cowrvalera/docker-cron-php:v1.0.0
    restart: unless-stopped
    platform: linux/amd64
    volumes:
      - ./src:/var/www/html
      - ./myjob/:/etc/cron.d/myjob
    ports:
      - "127.0.0.1:80:80"


```

### Start Example

```sh
	$ docker-compose up -d
```


### Stop Example

```sh
	$ docker-compose down
```

## License
MIT - see LICENSE