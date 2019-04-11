FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN useradd -m -s /bin/bash roger && \
    usermod -aG sudo roger

RUN apt update
    
RUN apt install -y python-dev python-pip

RUN apt install -y vim && \
    apt install git curl && \
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && \
    mkdir .fonts/ && cd .fonts/ && \
    git clone https://github.com/Lokaltog/powerline-fonts.git && \
    cd powerline-fonts/ && ./install.sh

RUN apt install -y wget && \
    apt install -y tmux


USER roger
WORKDIR /home/roger
ADD https://github.com/abcd40404/Docker/blob/master/.vimrc /home/roger
