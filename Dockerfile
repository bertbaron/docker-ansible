FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y locales apt-utils gnupg sudo wget jq dialog && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list.d/ansible.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt-get update && apt-get install -y ansible && rm -rf /var/lib/apt/lists/*

ENV EDITOR=/usr/bin/nano
ADD src /
RUN chmod +x /usr/local/bin/* /usr/local/wrappers/*
RUN mkdir /workdir

ADD https://raw.githubusercontent.com/bertbaron/runasme/master/runasme /runasme
RUN chmod +x /runasme

ENTRYPOINT ["/runasme"]
CMD [ "ansible-playbook", "--version" ]

