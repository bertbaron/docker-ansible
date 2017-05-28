FROM williamyeh/ansible:alpine3

RUN apk add --no-cache vim
RUN apk add --no-cache nano
ENV EDITOR=/usr/bin/nano

ADD https://raw.githubusercontent.com/bertbaron/runasme/master/runasme /runasme
RUN chmod +x /runasme
ENTRYPOINT ["/runasme"]
