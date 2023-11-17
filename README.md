# Ubuntu(22.04) + Cron + PHP 8.2 + Ioncube x86-64

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


File `./crontab`
```txt
* * * * *   www-data    /usr/bin/php -r 'echo "Hello";'
```


```sh
    $ docker run -it --rm -v "./src/:/var/www/html" -v "./crontab:/var/spool/cron/crontabs/www-data" --platform linux/amd64 cowrvalera/docker-cron-php:v1.0.0
```

## Examples(docker-compose.yaml)

```yaml
version: '3.1'

services:
  cron:
    image: cowrvalera/docker-cron-php:v1.0.0
    restart: unless-stopped
    platform: linux/amd64
    volumes:
      - ./src:/var/www/html
      - ./crontab:/var/spool/cron/crontabs/www-data


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
