#!/bin/bash
workRootDir=$HOME
mkdir -p $workRootDir/hub
git config --global user.name "tq"
git config --global user.email "tq@example.com"
cd $workRootDir/hub
git init --bare hello.git
cd $workRootDir/code
git init
git add ./*
git commit -m "initial"
git remote add origin tq@localhost:$workRootDir/hub/hello.git
git push -u origin master
sudo cp /home/tq/code/Jenkinsfile /var/lib/jenkins/
sudo chown jenkins:jenkins /var/lib/jenkins/Jenkinsfile
sudo systemctl restart jenkins
