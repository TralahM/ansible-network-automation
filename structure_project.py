#!/usr/bin/env python
import os
import subprocess

Root_Dirs = ["roles", "host_vars", "group_vars", "production", "staging"]
Role_Dirs = ["roles/"+d for d in ["common",
                                  "database", "nginx", "python", "monitoring"]]
Subroles_Dirs = [r+"/"+d for d in ["tasks", "files", "handlers",
                                   "templates", "vars", "defaults", "meta"] for r in Role_Dirs]
Root_Files = ["webservers.yml", "dbservers.yml",
              "playbook.yml", "recon.yml", "ansible.cfg", "hosts"]

prodstag_files = [d+"/hosts" for d in ["production", "staging"]]
var_files = [r+"/"+f for f in ["all.yml", "staging.yml", "production.yml"] for r in
             ["group_vars", "host_vars"]]

Subroles_Files = [r+"/main.yml" for r in Subroles_Dirs]


def mdirs(Dirs):
    for d in Dirs:
        # print(d)
        if not os.path.exists(d):
            os.makedirs(d)


def mfiles(Files):
    for f in Files:
        # print(f)
        os.system(f"touch {f}")


def run():
    print(f"Initializing an Ansible Project In {os.path.abspath('.')}")
    mdirs(Root_Dirs)
    mdirs(Role_Dirs)
    mdirs(Subroles_Dirs)
    mfiles(Root_Files)
    mfiles(prodstag_files)
    mfiles(var_files)
    mfiles(Subroles_Files)
    print("Done!")
    os.system("ls")


if __name__ == '__main__':
    run()
