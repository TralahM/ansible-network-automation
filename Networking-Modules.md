## Connecting to Networking Devices
All core networking modules implement a *provider* argument which is a collection of
arguments used to define the characteristics of how to connect to the device.

Each core network module supports and underlying operating system and transport. The
operating system is a one-to-one match with the module, and the transport maintains a
one-to-many relationship to the operating system as appropriate.

Some basic arguments supported by each core network module for configuring the transport:
* **host** - defines the hostname or IP address of the remote host
* **port** - defines the port to connect to
* **username** - defines the username to use to authenticate the connection
* **password** - defines the password to use to authenticate the connection
* **transport** - defines the type of connection transport to build
* **authorize** - enables privilege escalation for devices that require it
* **auth_pass** - defines the password, if needed, for privilege escalation

Individual modules can set defaults for these arguments to common values that match device
default configuration settings.
For instance the default value for transport is universally **cli**.
The provider argument comes into play here as every task needs to include the required
arguments. It accepts keyword arguments and passes them through to the task to assign
connection and authentication parameters.

The following two config modules are essentially identical (using *nxos_config*) as an
example but it applies to all core networking modules:

```yaml
---
nxos_config:
    src: config.j2
    host: "{{ inventory_hostname }}"
    username: "{{ ansible_ssh_user }}"
    password: "{{ ansible_ssh_pass }}"
    transport: cli
```


```yaml
---
vars:
    cli:
        host: "{{ inventory_hostname }}"
        username: "{{ ansible_ssh_user }}"
        password: "{{ ansible_ssh_pass }}"
        transport: cli

nxos_config:
    src: config.j2
    provider: "{{ cli }}"
```

Given the above two examples are equivalent, the arguments can also be used to establish
precedence and defaults which can be overridden below after the variable is used
