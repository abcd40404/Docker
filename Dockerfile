FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN adduser -m roger

RUN apt update
    
RUN apt install -y python-dev python-pip

RUN apt install -y vim && \
    apt install -y wget
