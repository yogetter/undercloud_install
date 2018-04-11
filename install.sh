#!/bin/bash
sudo useradd stack
sudo passwd stack
echo "stack ALL=(root) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/stack
sudo hostnamectl set-hostname undercloud.tripleo
sudo hostnamectl set-hostname --transient undercloud.tripleo
tmp=$(curl https://trunk.rdoproject.org/centos7/current/ | grep "python2-tripleo-repos" | awk 'BEGIN {FS="python2-tripleo-repos-"}; {print $2}')
rpmVersion=$(echo $tmp | awk 'BEGIN {FS=".el7.centos.noarch.rpm"}; {print $1}')
sudo yum install -y https://trunk.rdoproject.org/centos7/current/python2-tripleo-repos-$rpmVersion.el7.centos.noarch.rpm
sudo -E tripleo-repos -b queens current
sudo yum install -y python-tripleoclient
cp /usr/share/instack-undercloud/undercloud.conf.sample ~/undercloud.conf
sudo yum install -y vim bash-completion vim 
sudo yum update -y 
