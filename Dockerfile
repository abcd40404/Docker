FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

USER roger

RUN apt-get update && \
    apt-get -y install \
    apt install vim
