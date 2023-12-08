FROM debian:bullseye

RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/tkraikua.42.fr.key \
    -out /etc/ssl/certs/tkraikua.42.fr.crt \
    -subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=Narwhals/CN=tkraikua"

COPY ./conf/tkraikua.42.fr.conf /etc/nginx/sites-enabled/tkraikua.42.fr

RUN rm -rf /etc/nginx/sites-enabled/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
