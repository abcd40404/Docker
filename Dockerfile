FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN apt update && \
    apt install -y vim && \
    apt install -y python-dev
