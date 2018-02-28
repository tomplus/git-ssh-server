FROM arm32v7/ubuntu:16.04

RUN apt-get update \
 && apt-get install -y openssh-server bash git vim lighttpd libcgi-pm-perl \
 && rm /etc/update-motd.d/* \
 && addgroup --gid 1000 git \
 && adduser --home /home/git --shell /bin/bash --uid 1000 --gid 1000 --gecos "" --disabled-password git \
 && mkdir /var/run/sshd \
 && /usr/bin/ssh-keygen -A

ADD start.sh /start.sh

EXPOSE 22 1234

CMD ["/start.sh"]
