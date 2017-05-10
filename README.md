# Ansible Docker container

Allows to run ansible with a configuration on your local host using ssh keys and config
 from your localhost, updating any host in your network.

The simplest way to run it is by creating a wrapper script in, for example, $HOME/bin

`ansible-playbook`:
```
#!/bin/sh
docker run -t --rm -v $PWD:/workdir -v $HOME/.ssh:/home/user/.ssh bertbaron/ansible ansible-playbook "$@"
```

This will mount the current directory under /workdir in the image. The image uses the `runasme` script
(https://github.com/bertbaron/runasme) which will create a login-shell like environment with the userid
and groupid found on the mounted /workdir, with $HOME set to /home/user. This is needed because ssh is
very picky on owner and permissions of (config) files.

