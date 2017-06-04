#! /bin/bash
chown -Rf www-data:www-data /var/www
apachectl -d /etc/apache2/ -f /etc/apache2/apache2.conf -e info -DFOREGROUND

