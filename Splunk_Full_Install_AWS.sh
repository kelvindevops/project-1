#!/bin/bash
sudo yum update -y
cd /opt
sudo yum -y install wget net-tools
sudo mkdir /opt/splunk
sudo wget -O splunk-8.1.0-f57c09e87251-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.1.0&product=splunk&filename=splunk-8.1.0-f57c09e87251-Linux-x86_64.tgz&wget=true'
sudo tar -xvzf splunk-8.1.0-f57c09e87251-Linux-x86_64.tgz -C /opt
sudo useradd -md /opt/splunk splunk && echo welcome90 | passwd --stdin splunk
sudo usermod -aG wheel splunk
sudo chown -R splunk:splunk /opt/splunk
cd /opt/splunk/bin/
sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd welcome90
sudo /opt/splunk/bin/splunk enable boot-start
sudo /opt/splunk/bin/splunk status
#echo “welcome90” | passwd --stdin splunk
