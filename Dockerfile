FROM jenkins

CMD cd $JENKINS_HOME/plugins && _ 
curl -O http://updates.jenkins-ci.org/latest/docker-plugin.hpi
