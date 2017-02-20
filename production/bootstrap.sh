#!/usr/bin/env bash

add-apt-repository ppa:webupd8team/java
add-apt-repository ppa:cwchien/gradle
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/" > /etc/environment
echo "export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /etc/environment
apt-get update
apt-get upgrade -y
apt-get install -y oracle-java8-installer
apt-get install -y gradle
apt-get install -y mongodb-org

