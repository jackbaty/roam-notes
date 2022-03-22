FROM caddy:2
COPY Caddyfile /etc/caddy/Caddyfile
WORKDIR /public_html
COPY ./public_html/*.html ./
COPY ./public_html/files/ files/
COPY ./public_html/*.css css/
COPY ./public_html/*.js js/
