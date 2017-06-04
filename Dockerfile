FROM ubuntu:16.04
MAINTAINER Red Nixon "info@rednixon.io"

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -q -y \
    apt-transport-https \
    lsb-release \
    wget \
    apt-utils \
    curl \
    nano \
    zip \
    unzip \
    python-pip \
    git \
    ca-certificates \
	vim \
	apache2 \
	php7.0 \
	php7.0-mbstring \
	php-curl \
	libapache2-mod-php 

RUN sed -i -e 'sMDocumentRoot /var/www/htmlMDocumentRoot /var/www/publicMg' /etc/apache2/sites-available/000-default.conf
RUN chown -Rf www-data:www-data /var/www/
RUN a2enmod php7.0

# Add Scripts
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 80

CMD ["/start.sh"]
