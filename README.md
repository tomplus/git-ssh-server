# git-ssh-server

Docker image based on Alpine with git &amp; sshd to simplify creating own git server

## Usage

### Preparing volume

```
$ mkdir -p ~/git-server/.ssh
$ mkdir ~/git-server/pub
$ cp ~/.ssh/id_rsa.pub ~/git-server/.ssh/authorized_keys
$ sudo chown 1000:1000 -R ~/git-server
$ sudo chmod 700 ~/git-server
$ sudo chmod 700 ~/git-server/.ssh
$ sudo chmod 600 ~/git-server/.ssh/authorized_keys
```

### Start image

```
$ docker run -d -v ~/git-server:/home/git -p 22:22 --rm tpimages/git-ssh-server:latest
```

now you can create a repository (path /git is linked to /home/git/pub):

```
$ ssh git@localhost
Welcome to your git-server !
$ mkdir pub/project.git
$ cd pub/project.git/
$ git init --bare
Initialized empty Git repository in /home/git/pub/project.git/
```

and now you can clone it:

```
$ git clone ssh://git@localhost/pub/project.git
```

## Troubleshooting

To see sshd logs, attach to the container and start syslogd.

```
syslogd
tail -f /var/log/messages
```

# ARM32v7

Dedicated branch ARM32v7 contains Dockerfile for this architecutre.
