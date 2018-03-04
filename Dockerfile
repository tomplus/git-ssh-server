FROM alpine:3.5

RUN apk add --no-cache openssh git vim lighttpd perl-cgi \
 && addgroup -g 1000 git \
 && adduser -h /home/git -s /bin/sh -u 1000 -G git -g "" -D git \
 && mkdir /var/run/sshd \
 && /usr/bin/ssh-keygen -A \
 && echo "PasswordAuthentication no" > /etc/ssh/sshd_config \
 && sed -i s/git:!/"git:*"/g /etc/shadow \
 && echo "Welcome to your git server !" > /etc/motd

ADD start.sh /start.sh

EXPOSE 22 1234

CMD ["/start.sh"]
