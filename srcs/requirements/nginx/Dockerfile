FROM debian:bookworm

RUN apt -y update
RUN apt -y install nginx
# RUN apt -y install openssl

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/ssl/certs/nginx.key \
#     -out /etc/ssl/certs/nginx.crt \
#     -subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=Narwhals/CN=tkraikua"

# COPY ./conf/default /etc/nginx/sites-enabled/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]