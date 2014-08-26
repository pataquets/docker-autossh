FROM pataquets/ubuntu-base

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y install autossh && \
	apt-get clean

RUN mkdir -vp /opt/autossh
VOLUME /opt/autossh
