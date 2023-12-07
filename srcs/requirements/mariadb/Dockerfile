FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld && \
	chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/init_db.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init_db.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/init_db.sh" ]
CMD [ "mysqld" ]
