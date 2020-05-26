FROM domingosjunior87/php5.2.17:latest

# link 1 https://serverfault.com/questions/539577/how-to-build-install-pgsql-php-extension-manually-on-ubuntu
# link 2 https://askubuntu.com/questions/597462/how-to-install-php-5-2-x-on-ubuntu-14-04
RUN apt-get update && \
    apt-get install -y --no-install-recommends autoconf make libpq5 libpq-dev && \
	cd /php/php-5.2.17/ext/pgsql && \
	phpize && \
	./configure && \
	make && \
	make install

COPY php.ini /etc/php/apache2-php5.2/
COPY php.ini /etc/php/cli-php5.2/

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
