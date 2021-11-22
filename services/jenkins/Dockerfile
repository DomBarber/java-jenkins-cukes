FROM jenkins/jenkins:lts-jdk11

USER root

RUN \
    apt-get update && \
    apt-get install -y build-essential && \
    apt-get clean

RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

RUN groupadd docker -f
RUN usermod -aG docker 'jenkins'
RUN usermod -a -G root jenkins

# To allow us to access /var/run/docker.sock on the Mac
RUN gpasswd -a jenkins staff

USER jenkins

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]