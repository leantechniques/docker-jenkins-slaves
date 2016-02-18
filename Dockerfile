FROM jenkins


RUN mkdir $JENKINS_HOME/plugins \ 
    && cd $JENKINS_HOME/plugins \
    && curl -O http://updates.jenkins-ci.org/latest/docker-plugin.hpi
