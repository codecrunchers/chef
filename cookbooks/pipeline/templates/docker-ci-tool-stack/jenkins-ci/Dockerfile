#https://raw.githubusercontent.com/jenkinsci/workflow-aggregator-plugin/master/demo/Dockerfile
FROM jenkinsci/jenkins:latest
#FROM d362f167c047

USER root

USER root
RUN apt-get update \
      && apt-get install -y sudo curl\
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers


# installed maven package is still 3.0.5, pretty old
ENV MAVEN_VERSION 3.3.9
RUN cd /usr/local; wget -O - http://ftp.heanet.ie/mirrors/www.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar xvzf -
RUN ln -sv /usr/local/apache-maven-$MAVEN_VERSION /usr/local/maven

#COPY plugins /var/jenkins_home/plugins/
COPY plugins.txt .
RUN /usr/local/bin/install-plugins.sh plugins.txt
RUN chown -R jenkins.jenkins /usr/share/jenkins/ref

COPY config/config.xml /usr/share/jenkins/ref/config.xml

# Jenkins Settings, i.e. Maven, Groovy, ...
COPY config/hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
COPY config/hudson.plugins.groovy.Groovy.xml /usr/share/jenkins/ref/hudson.plugins.groovy.Groovy.xml
COPY config/maven-global-settings-files.xml /usr/share/jenkins/ref/maven-global-settings-files.xml


# SSH Keys & Credentials
COPY config/credentials.xml /usr/share/jenkins/ref/credentials.xml
COPY config/ssh-keys/cd-demo /usr/share/jenkins/ref/.ssh/id_rsa
COPY config/ssh-keys/cd-demo.pub /usr/share/jenkins/ref/.ssh/id_rsa.pub

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state


COPY run.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/run.sh

EXPOSE 8080 8081 9418

USER jenkins

CMD /usr/local/bin/run.sh

