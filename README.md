# MqGateway Ansible

Ansible playbook to install MqGateway and other home automation software 
on MqGateway host (currently only NanoPi is fully supported).

## Prerequisites

Your local machine should have Docker installed.

MqGateway hosts should have Debian-based linux distribution installed 
with following software:
- Python 3.x

##  Configuration

1. Add all MqGateway hosts to `hosts.yaml` file like this:
    ```yaml
    all:
     hosts:
       porch:
         ansible_host: 192.168.1.120
         ansible_password: "{{ lookup('env','SSH_PASS') }}" # alternatively put actual password
       livingroom:
         ansible_host: 192.168.1.121
         ansible_password: "{{ lookup('env','SSH_PASS') }}" # alternatively put actual password
    ```
2. Add MqGateway configuration files in `files/<host-name>/gateway.yml` for all 
hosts configured in 1.
3. Adjust configuration in `group_vars/all.yaml` if needed.
 

## Running

Change `/path/to/this/directory` and `nanopi-password` in the command below to 
match your configuration and run it:

```
docker run --name ansible --rm \
  -v /path/to/this/directory:/data/playbook \
  -e SSH_PASS=nanopi-password \
  -e ANSIBLE_HOST_KEY_CHECKING=False  \
  williamyeh/ansible:alpine3 \
  ansible-playbook -i /data/playbook/hosts.yaml /data/playbook/mqgateway.yaml
```

You don't need `-e SSH_PASS=nanopi-password` if you have specified passwords 
directly in `hosts.yaml` (see [configuration](#configuration)).
