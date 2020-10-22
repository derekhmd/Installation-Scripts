#!/bin/bash
# Currently targeted towards CENTOS

function install_jenkins {
	sudo yum update –y
	sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
	sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
	sudo yum install jenkins -y
}

function install_jenkins_cli {
	JENKINS_CLI_ADDR="http://${1}/jnlpJars/jenkins-cli.jar"
	wget $JENKINS_CLI_ADDR
}


RDIR=$(pwd)
if [ ! yum list installed jenkins >/dev/null 2>&1 ]; then
	install_jenkins
fi
sudo service jenkins start

# Obtain URL to initiate in-browser management
PUBLIC_HOST=$(curl http://169.254.169.254/latest/meta-data/public-hostname)
PUBLIC_HOST_WPORT="${PUBLIC_HOST}:8080"
echo -e "\n\nPlease connect to http://${PUBLIC_HOST_WPORT}\n\n"

echo -e "Initial Admin Password for first-time setup:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Configure the Jenkins Server username info
#TODO: CHANGE MY CREDENTIALS
git config --global user.email MY_EMAIL 
git config --global user.name MY_USERNAME


cd $RDIR
if [ ! -f "jenkins-cli.jar" ]; then
	install_jenkins_cli ${PUBLIC_HOST_WPORT}
fi
