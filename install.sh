#!/bin/bash
sudo useradd stack
sudo passwd stack
echo "stack ALL=(root) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/stack
sudo hostnamectl set-hostname undercloud.tripleo
sudo hostnamectl set-hostname --transient undercloud.tripleo
sudo curl -L -o /etc/yum.repos.d/delorean-pike.repo https://trunk.rdoproject.org/centos7-pike/current/delorean.repo
sudo curl -L -o /etc/yum.repos.d/delorean-deps-pike.repo https://trunk.rdoproject.org/centos7-pike/delorean-deps.repo
sudo yum install -y yum-plugin-priorities
sudo yum install -y python-tripleoclient
cp /usr/share/instack-undercloud/undercloud.conf.sample ~/undercloud.conf
sudo yum install -y vim bash-completion vim 
sudo yum update -y 
