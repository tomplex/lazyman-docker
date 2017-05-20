FROM ubuntu:16.04

USER root

RUN apt-get update && apt-get install -y \
	python \
	python-pip \
	unzip \
	openjdk-8-jre \
	wget

RUN pip install streamlink

WORKDIR /lazyman

RUN wget -O lazyman.zip  https://github.com/StevensNJD4/LazyMan/releases/download/v2.0.20170411/2_2_0_20170411_unix.zip && \
	unzip lazyman.zip

ADD ./docker_entrypoint.sh docker_entrypoint.sh

RUN chmod +x docker_entrypoint.sh

ENTRYPOINT ./docker_entrypoint.sh
