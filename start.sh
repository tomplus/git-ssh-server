#!/bin/bash

echo "Verifying configuration..."

if [ $(stat -c %a%u%g /home/git/.ssh/authorized_keys) != "60010001000" ]; then
    echo "User git does not have valid ~/.ssh/authorized_keys !"
    echo "Dump of ~/.ssh/"
    ls -alh /home/git/.ssh/
    exit 1
fi

if [ ! -f "/pub" ]; then
    ln -s /home/git/pub /pub
fi

echo "Start ssh server"
/usr/sbin/sshd -D
