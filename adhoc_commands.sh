#!/usr/bin/env sh

# reboot all servers docker 10 at a time
ansible docker -a "/sbin/reboot" -f 10
ansible docker -m shell -a "uname -a"
ansible docker -m copy -a "src=~/.vimrc dest=~/.vimrc mode=600"
ansible all -m user -a "name=african"
ansible webservers -m git -a "repo=https://github.com/TralahM/tralahtek.git dest=~/
version=HEAD"
ansible webservers -m service -a "name=nginx state=restarted"
ansible webservers -m service -a "name=nginx state=stopped"
ansible webservers -m service -a "name=nginx state=started"

# Gathering Facts
ansible all -m setup
