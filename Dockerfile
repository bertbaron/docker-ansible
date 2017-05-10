FROM williamyeh/ansible:alpine3

ADD https://raw.githubusercontent.com/bertbaron/runasme/master/runasme /runasme
RUN chmod +x /runasme

ENTRYPOINT ["/runasme"]