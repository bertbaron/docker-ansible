# Ansible Docker container

[![](https://images.microbadger.com/badges/version/bertbaron/ansible.svg)](http://microbadger.com/images/bertbaron/ansible "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/bertbaron/ansible.svg)](http://microbadger.com/images/bertbaron/ansible "Get your own image badge on microbadger.com")

Allows to run ansible with a configuration on your local host using ssh keys and config
from your localhost, updating any host in your network.

This image is actually a small wrapper around the image https://hub.docker.com/r/williamyeh/ansible.

The reason for yet another ansible image is that I had problems with mounting the local .ssh folder
(problems with config file permissions, not being able to update `known_hosts` etc.). Therefore I added
the script `runasme` which will create a login-shell like environment in which the command is run, even supporting
interactive commands like ansible-vault with either nano or vim as defualt editor.

The easiest way to use this image is to install the wrapper scripts in a folder in your path. For example:

```shell
docker run -ti --rm -e UID=$(id -u) -e GID=$(id -g) -v ~/bin:/workdir \
bertbaron/ansible setup
```

This will create wrapper scripts for the ansible commands in your local bin folder, which is automatically included in
your path on most linux distributions (may require a new login when created for the first time).

For options for more fine-grained control over user and permissions, see https://github.com/bertbaron/runasme or run:

```shell
docker run --rm bertbaron/ansible -h
```
