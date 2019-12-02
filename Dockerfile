FROM alpine:3.10

RUN apk add --no-cache sudo openssl ca-certificates nano jq dialog
RUN apk add --no-cache ansible

ENV EDITOR=/usr/bin/nano
ADD src /
RUN chmod +x /usr/local/bin/* /usr/local/wrappers/*
RUN mkdir /workdir

ADD https://raw.githubusercontent.com/bertbaron/runasme/master/runasme /runasme
RUN chmod +x /runasme

ENTRYPOINT ["/runasme"]
CMD [ "ansible-playbook", "--version" ]
