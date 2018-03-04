### Ansible Docker container

[![](https://images.microbadger.com/badges/version/bertbaron/ansible.svg)](http://microbadger.com/images/bertbaron/ansible "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/bertbaron/ansible.svg)](http://microbadger.com/images/bertbaron/ansible "Get your own image badge on microbadger.com")

Allows to run ansible with a configuration on your local host using ssh keys and config
from your localhost, updating any host in your network.

This image is actually a small wrapper around the image [williamyeh/ansible](https://hub.docker.com/r/williamyeh/ansible/).

The reason for yet another ansible image is that I had problems with mounting the local .ssh folder
(problems with config file permissions, not being able to update `known_hosts` etc.). Therefore I added
the script `runasme` which will create a login-shell like environment in which the command is run, even supporting
interactive commands like ansible-vault with either nano or vim as defualt editor.

### Setup

The easiest way to use this image is to install the wrapper scripts in a folder in your path. For example:

```bash
docker pull bertbaron/ansible
docker run -ti --rm -e UID=$(id -u) -e GID=$(id -g) -v ~/bin:/workdir \
bertbaron/ansible setup
```

This will create wrapper scripts for the ansible commands in your local bin folder, which is automatically included in
your path on most linux distributions (may require a new login when created for the first time).

The scripts run ansible as usual, mounting the current working directory to ```/workdir``` and the ```~/.ssh```
directory to ```/home/user/.ssh```.


### Usage

The scripts can be used as is, but note that you need to specify the hosts file explicitly because the command only sees
the current working directory. Personally I use a simple wrapper script like the following:

```bash
#!/bin/bash
time ansible-playbook -i hosts -b --vault-password-file=/home/user/.ssh/.pwd site.yml "$@"
```
