#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.11  ext-vga-int-1
10.0.15.101  mesos-master-1
10.0.15.201  mesos-agent-1
10.0.15.202  mesos-agent-2

EOL

# Generate a private/public keypair for the cluster
su - vagrant -c "cat /dev/zero | ssh-keygen -q -N ''"
