FROM ubuntu:22.04

ARG PHP_VERSION_DEFAULT=8.2
ARG TARGETOS_DEFAULT=lin
ARG TARGETARCH_DEFAULT=x86-64


ENV TARGETOS=${TARGETOS_DEFAULT}
ENV TARGETARCH=${TARGETARCH_DEFAULT}

ENV BUILDX_ARCH="_${TARGETOS}_${TARGETARCH}"



ENV PHP_VERSION=${PHP_VERSION_DEFAULT}


RUN apt update && apt install tzdata -y
ENV TZ="Europe/Moscow"

RUN apt-get -y update && apt-get install -y software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get -y update

RUN apt-get install -y \
    curl \
    unzip \
    cron \
    php${PHP_VERSION} \
    php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-enchant \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-gmp \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-imap \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-mcrypt \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-mysqlnd \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-pspell \
    php${PHP_VERSION}-snmp \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-sockets \
    php${PHP_VERSION}-tidy \
    php${PHP_VERSION}-xmlreader \
    php${PHP_VERSION}-xmlrpc \
    php${PHP_VERSION}-xmlwriter \
    php${PHP_VERSION}-xsl \
    php${PHP_VERSION}-zip

WORKDIR /usr/lib/php/20131226/
RUN curl https://downloads.ioncube.com/loader_downloads/ioncube_loaders${BUILDX_ARCH}.tar.gz | tar -xz
RUN echo "zend_extension = \"/usr/lib/php/20131226/ioncube/ioncube_loader_lin_${PHP_VERSION}.so\"" > /etc/php/${PHP_VERSION}/apache2/conf.d/00-ioncube.ini


RUN apt install -y vim sudo


RUN apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN id -u www-data &>/dev/null || useradd -r -u 33 -g www-data www-data




# Latest releases available at https://github.com/aptible/supercronic/releases
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.29/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=cd48d45c4b10f3f0bfdd3a57d054cd05ac96812b

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic



WORKDIR "/var/www/html"    

USER www-data

CMD /usr/local/bin/supercronic-linux-amd64 /crontab



