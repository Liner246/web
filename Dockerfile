FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf && \
    mkdir /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.pem --subj "/C=UA/ST=./L=./O=./CN=."

COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
COPY admin.html /usr/share/nginx/html/
COPY 40x.html /usr/share/nginx/html/
COPY htpasswd /etc/nginx/.htpasswd