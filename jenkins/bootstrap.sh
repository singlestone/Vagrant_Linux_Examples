#!/usr/bin/env bash


add-apt-repository ppa:webupd8team/java
add-apt-repository ppa:cwchien/gradle
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/" > /etc/environment
echo "export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /etc/environment

apt-get update
apt-get upgrade
apt-get install -y unzip
apt-get install -y apache2
apt-get install -y jenkins
apt-get install -y oracle-java8-installer
apt-get install -y gradle
apt-get install -y git

wget -q --directory-prefix=/vagrant/ http://sourceforge.net/projects/artifactory/files/artifactory/3.9.2/artifactory-3.9.2.zip
unzip /vagrant/artifactory-3.9.2.zip -d /var/lib/
rm -f /vagrant/artifactory-3.9.2.zip
bash /var/lib/artifactory-3.9.2/bin/installService.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/opt/jfrog/artifactory/default
service artifactory start
service jenkins start


#apt-get install -y git
#/etc/init.d/jenkins restart


#/vagrant/artifactory-3.9.2/artifactory-3.9.2/tomcat/bin/catalina.sh: 1: eval: /usr/lib/jvm/java-8-oracle//bin/java: not found


#Plugins

#Gradle
#Build Pipeline Plugin
#Artifactory Plugin
#Maven Repository Schedule Cleanup Plugin
#Repository Connector
#SSH Slaves plugin
#Publish Over SSH plugin
