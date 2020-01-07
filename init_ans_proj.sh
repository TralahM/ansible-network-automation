#!/usr/bin/env sh
echo "Initializing Ansible Project ..."
find . -type d -exec ad \{ production, staging \}/hosts \;

find . -type d -exec ad \{group_vars/{ all, local \} \;
find . -type d -exec ad \{host_vars/{ docker, local \} \;

find . -type d -exec ad  \{ site.yml, webservers.yml, dbservers.yml, networkservers.yml \} \;

find . -type d -exec ad \
\roles/\{ common, webtier, monitoring, db \}/{ tasks, handlers, vars, defaults, meta \}/main.yml \;
find . -type d -exec ad \{roles/{ common,webtier,monitoring,db \}/templates/{ nginx.conf.j2,apache.conf.j2 \} \;
find . -type d -exec ad \{roles/common/files/{ .vimrc, .zshrc, .tmux.conf, .tmux.conf.local \} \;
find . -type d -exec cp ~/\{ .vimrc, .zshrc, .tmux.conf, .tmux.conf.local \} ./roles/common/files \;


echo "Initializing Playbook templates....."

echo "---\n# file: site.yml [master-playbook]\n- import_playbook: webservers.yml\n- import_playbook: dbservers.yml\n- import_playbook: networkservers.yml" > site.yml

echo "---\n# file: webservers.yml\n- hosts: webservers\n\troles:\n\t\t- common\n\n\t- webtier" > webservers.yml

echo "---\n# file: dbservers.yml\n- hosts: dbservers\n\troles:\n\t\t- common\n\n\t- db" > dbservers.yml

echo "---\n# file: networkservers.yml\n- hosts: networkservers\n\troles:\n\t\t- common\n\n\t- monitoring" > networkservers.yml

echo "Done"
# tree
