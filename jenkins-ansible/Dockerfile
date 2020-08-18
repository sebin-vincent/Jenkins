FROM jenkins/jenkins

USER root

RUN apt update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get install -y ansible -u   

USER jenkins

COPY ./remote-key /tmp/remote-key