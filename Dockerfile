FROM alpine:3.10.3

RUN apk add --no-cache sudo openssl ca-certificates nano jq dialog

RUN apk add --no-cache python3
RUN apk add --virtual dev --no-cache python3-dev build-base libffi-dev openssl-dev \
    && pip3 install --no-cache-dir ansible==2.9.2 \
    && apk del dev

# Paramiko gives issues, so for now use native ssh
RUN apk add --no-cache openssh

ENV EDITOR=/usr/bin/nano
ADD src /
RUN chmod +x /usr/local/bin/* /usr/local/wrappers/*
RUN mkdir /workdir

ADD https://raw.githubusercontent.com/bertbaron/runasme/master/runasme /runasme
RUN chmod +x /runasme

ENTRYPOINT ["/runasme"]
CMD [ "ansible-playbook", "--version" ]

