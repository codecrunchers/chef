#https://raw.githubusercontent.com/jenkinsci/workflow-aggregator-plugin/master/demo/Dockerfile
FROM jenkinsci/jenkins:latest
#FROM d362f167c047

USER root

# installed maven package is still 3.0.5, pretty old
ENV MAVEN_VERSION 3.3.9
RUN cd /usr/local; wget -O - http://ftp.heanet.ie/mirrors/www.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar xvzf -
RUN ln -sv /usr/local/apache-maven-$MAVEN_VERSION /usr/local/maven

#COPY plugins /var/jenkins_home/plugins/
#COPY plugins.txt .
#RUN /usr/local/bin/plugins.sh plugins.txt

RUN echo 2.19 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN chown -R jenkins.jenkins /usr/share/jenkins/ref
COPY run.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/run.sh

EXPOSE 8080 8081 9418

USER jenkins

CMD /usr/local/bin/run.sh

