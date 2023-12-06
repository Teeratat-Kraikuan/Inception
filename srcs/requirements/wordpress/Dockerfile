FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wget unzip php php-fpm php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY tools/init_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init_wordpress.sh

EXPOSE 9000

# ENTRYPOINT [ "/usr/local/bin/init_wordpress.sh" ]
