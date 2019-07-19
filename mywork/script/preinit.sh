#!/bin/bash
#jenkins
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins
sudo yum install -y java-1.8.0-openjdk  java-1.8.0-openjdk-devel
sudo yum install -y git
sudo usermod -aG tq jenkins
sudo chmod 750 /home/tq

#ansible
sudo yum install epel-release -y
sudo yum install ansible -y
sudo chmod 666 /etc/ssh/ssh_config
sudo echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
sudo chmod 666 /etc/ansible/ansible.cfg
sudo echo "private_key_file = /home/tq/.ssh/id_rsa" >> /etc/ansible/ansible.cfg
sudo chmod 644 /etc/ansible/ansible.cfg

#key
if [ -e $HOME/.ssh/id_rsa.pub ];then
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
else
    ssh-keygen -q -t rsa -N "" -f $HOME/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
fi
chmod 600 $HOME/.ssh/authorized_keys

#配置jenkins密钥
sudo mkdir -p /var/lib/jenkins/.ssh
sudo chmod 777 /var/lib/jenkins/.ssh
sudo cp ~/.ssh/id_rsa /var/lib/jenkins/.ssh/
sudo chmod 700 /var/lib/jenkins/.ssh
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh

#启动jenkins
sudo systemctl start jenkins && sudo chkconfig jenkins on
