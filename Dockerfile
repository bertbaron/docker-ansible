FROM alpine:3.10

RUN apk add --no-cache sudo openssl ca-certificates nano jq dialog
RUN apk add --no-cache ansible

RUN pip3 install 'paramiko>=2.5.0' # see https://github.com/ansible/ansible/issues/52598

ENV EDITOR=/usr/bin/nano
ADD src /
RUN chmod +x /usr/local/bin/* /usr/local/wrappers/*
RUN mkdir /workdir

ADD https://raw.githubusercontent.com/bertbaron/runasme/master/runasme /runasme
RUN chmod +x /runasme

ENTRYPOINT ["/runasme"]
CMD [ "ansible-playbook", "--version" ]
