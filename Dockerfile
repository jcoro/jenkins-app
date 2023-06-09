FROM jenkins/jenkins:lts-jdk17

USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -c "Jenkins" jenkins
RUN usermod -o -u 0 jenkins
RUN usermod -g 0 jenkins


USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false