### Ansible Docker container

[![](https://images.microbadger.com/badges/version/bertbaron/ansible.svg)](http://microbadger.com/images/bertbaron/ansible "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/bertbaron/ansible.svg)](http://microbadger.com/images/bertbaron/ansible "Get your own image badge on microbadger.com")

Ansible client container aimed to behave as much as possible as a locally installed Ansible.

Allows to run Ansible with a configuration on your local host using ssh keys and config from your localhost, updating any host in your network. This makes it very easy to get started with Ansible.

### Setup

#### Install
The easiest way to use this image is to install the wrapper scripts in a folder in your path. For example:

```bash
docker pull bertbaron/ansible
docker run --rm -ti -v /usr/local/bin:/workdir bertbaron/ansible setup
```

This will create wrapper scripts for the ansible commands in /usr/local/bin.<sup>1</sup>

The scripts run ansible as usual, mounting the current working directory to ```/workdir``` and the ```~/.ssh```
directory to ```/home/user/.ssh```.

<sup>1</sup> You can use any other folder (i.e. $HOME/bin), just make sure the folder is in your path

#### Updating / switching between ansible versions

Instead of running the setup command again the version can also be easily updated using:

```bash
ansible-update
```

#### Uninstall

To uninstall, run:

```bash
ansible-uninstall
```

### Usage

The scripts can be used as is, but note that you need to specify the hosts file explicitly because the command only sees
the current working directory. Personally I use a simple wrapper script like the following:

```bash
#!/bin/bash
ansible-playbook -i hosts -b --vault-password-file=/home/user/.ssh/.pwd site.yml "$@"
```

### About this image

Reasons to use Ansible from a container:

 * No other local requirements than docker
 * Ansible version independent from the one that may be provided by the OS package management

Reason to make yet another Ansible container:

 * In contrary to other containers I tried this container allows to use the authorized ssh keys on the host

Reasons not to use this image:

 * Only a selection of ansible versions available (see https://hub.docker.com/repository/docker/bertbaron/ansible/tags)
 * Limited support
 * A more complex (production) site may require more control over the way Ansible is used
