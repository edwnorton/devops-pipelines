#!/bin/bash
codeRootDir=$HOME/tomcat
workRootDir=$HOME
if [ -d $codeRootDir ];then 
    cd $codeRootDir
    if [ -d $codeRootDir/hello ];then 
        rm -rf hello
    fi
else
    mkdir -p $codeRootDir
    cd $codeRootDir
fi
git clone tq@localhost:/home/tq/hub/hello.git
if [ -d $codeRootDir/hello ];then
    cd $codeRootDir/hello
    jar cvf hello.war ./*
else
    echo "Clone code error,please check."
    exit 1
fi
