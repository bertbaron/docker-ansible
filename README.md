# Ansible Docker container

[![](https://images.microbadger.com/badges/version/bertbaron/docker-ansible.svg)](http://microbadger.com/images/bertbaron/docker-ansible "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/bertbaron/docker-ansible.svg)](http://microbadger.com/images/bertbaron/docker-ansible "Get your own image badge on microbadger.com")

Allows to run ansible with a configuration on your local host using ssh keys and config
from your localhost, updating any host in your network.

The reason for yet another ansible image is that I had problems with mounting the local .ssh folder
(problems with config file permissions, not being able to update `known_hosts` etc.). Therefore I added
the script `runasme` which will create a login-shell like environment in which the command is run.

The easiest way to use this image is to add a wrapper script on the PATH, for example:

`$HOME/bin/ansible-playbook`:
```shell
#!/bin/sh
docker run -ti --rm -v $PWD:/workdir -v $HOME/.ssh:/home/user/.ssh \
       bertbaron/ansible ansible-playbook "$@"
```

This will mount the current directory under /workdir in the image. The image will start ansible in that
workdir as the user and group of the workdir itself.

For options for more fine-grained control over user and permissions, see https://github.com/bertbaron/runasme or run:

```shell
docker run --rm bertbaron/ansible -h
```
