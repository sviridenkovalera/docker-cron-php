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


File `./crond.d/crontab`
```txt
* * * * *	www-data	bash -c "/usr/bin/php -r 'echo \"Hello\";'  > /dev/stdout 2>/dev/stderr"
```


```sh
docker run -it --rm -v "./src/:/var/www/html" -v "./cron.d/crontab:/crontab" --platform linux/amd64 cowrvalera/docker-cron-php:1.3.0
```

## Examples(docker-compose.yaml)

```yaml
version: '3.1'

services:
  cron:
    image: cowrvalera/docker-cron-php:1.3.0
    restart: unless-stopped
    platform: linux/amd64
    volumes:
      - ./src:/var/www/html
      - ./cron.d/crontab:/crontab


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
