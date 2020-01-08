#!/usr/bin/env sh
echo "Initializing Ansible Project ..."
ad production/hosts
ad production/hosts
ad group_vars/{all,local,hosts}
ad host_vars/{all,local,hosts}

touch {site.yml,webservers.yml,dbservers.yml,networkservers.yml}
mkdir -p roles/{common,webtier,monitoring,database,nginx}/{tasks,handlers,vars,defaults,meta}

ad roles/{common,webtier,monitoring,db}/{tasks,files,templates,handlers,vars,defaults,meta}/main.yml

echo "Done"
