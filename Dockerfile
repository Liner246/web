FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
COPY admin.html /usr/share/nginx/html/
COPY 40x.html /usr/share/nginx/html/
COPY htpasswd /etc/nginx/.htpasswd