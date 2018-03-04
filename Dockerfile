FROM williamyeh/ansible:alpine3

RUN apk add --no-cache vim
RUN apk add --no-cache nano
ENV EDITOR=/usr/bin/nano
ADD src /
RUN chmod +x /usr/local/bin/setup /usr/local/wrappers/*

ADD https://raw.githubusercontent.com/bertbaron/runasme/master/runasme /runasme
RUN chmod +x /runasme

ENTRYPOINT ["/runasme"]
