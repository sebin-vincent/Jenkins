FROM ubuntu:18.04

RUN apt update

RUN apt-get -y install mysql-client


RUN DEBIAN_FRONTEND=noninteractive apt -y install awscli --upgrade

RUN apt-get -y install openssh-server

RUN mkdir /var/run/sshd

RUN useradd --shell /bin/bash remote_user && \
    echo "remote_user:password" | chpasswd && \
    mkdir /home/remote_user/.ssh -p && \
    chmod 700 /home/remote_user/.ssh && \
    mkdir -p -m0755 /var/run/sshdh


COPY remote-key.pub /home/remote_user/.ssh/authorized_keys


RUN chown remote_user:remote_user   -R /home/remote_user && \
    chmod 400 /home/remote_user/.ssh/authorized_keys



RUN ssh-keygen -A



EXPOSE 22

RUN rm -rf /run/nologin

CMD /usr/sbin/sshd -D