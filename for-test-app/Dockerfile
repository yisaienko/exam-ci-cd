FROM alpine:3.14

LABEL maintainer="for-test-app"

RUN apk update \
	&& apk upgrade \
	&& apk add nginx \
	&& apk add bash
	
COPY ./*.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
COPY targets.json /var/http/

CMD ["nginx", "-g", "daemon off;"]