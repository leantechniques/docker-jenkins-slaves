FROM jenkins

# Add jenkins to the sudoers group
USER root
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# install all the plugins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
