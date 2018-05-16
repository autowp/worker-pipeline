FROM ubuntu:bionic

LABEL app_name="worker-pipeline"

VOLUME /var/log

WORKDIR /app

RUN apt-get update -qq -y && \
    apt-get dist-upgrade -qq -y && \
    apt-get install -qq -y \
        at \
        bzip2 \
        cron \
        curl \
        libasound2 \
        libcurl4-gnutls-dev \
        libdbus-glib-1-2 \
        libfontconfig \
        libgtk2.0-0 \
        libxcomposite1 \
        libxrender1 \
        libyaml-dev \
        openssh-client \
        php \
        php-bcmath \
        php-curl \
        php-json \
        php-mbstring \
        php-sockets \
        php-zip \
        php-yaml \
        php-xdebug \
        tar \ 
        unzip \
        wget \
        xvfb \
        zlib1g-dev \
        && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    \
    curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    \
    curl -o /usr/local/bin/waitforit -sSL https://github.com/maxcnunes/waitforit/releases/download/v2.2.0/waitforit-linux_amd64 && chmod +x /usr/local/bin/waitforit
