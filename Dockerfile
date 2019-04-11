FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN useradd -m -s /bin/bash roger

RUN apt update
    
RUN apt install -y python-dev python-pip

RUN apt install -y vim && \
    apt install -y wget && \
    apt install -y tmux \

RUN apt autoremove -y && \
    apt autoclean -y \

USER roger
WORKDIR /home/roger
