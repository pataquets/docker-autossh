FROM pataquets/ubuntu-base

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y install autossh && \
	apt-get clean

RUN mkdir -vp /opt/autossh
VOLUME /opt/autossh

RUN mkdir -vp /root/.ssh/
RUN chmod go-rwx /root/.ssh/
VOLUME /root/.ssh/

ADD autossh-run /root/
ADD README.txt /root/

WORKDIR /root

ENTRYPOINT [ "/root/autossh-run" ]
