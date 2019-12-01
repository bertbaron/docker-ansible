FROM alpine:3.9

RUN apk add --no-cache ansible

ENV EDITOR=/usr/bin/nano
ADD src /
RUN chmod +x /usr/local/bin/setup /usr/local/wrappers/*
RUN mkdir /workdir

CMD [ "ansible-playbook", "--version" ]
