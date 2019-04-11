FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN useradd -m -s /bin/bash roger && \
    usermod -aG sudo roger && \
    echo 'roger:roger' | chpasswd

WORKDIR /home/roger
ADD https://raw.githubusercontent.com/abcd40404/Docker/master/.vimrc /home/roger

RUN apt update
    
RUN apt install -y python-dev python-pip

RUN apt install -y vim && \
    apt install -y git curl && \
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && \
    mkdir .fonts/ && cd .fonts/ && \
    git clone https://github.com/Lokaltog/powerline-fonts.git && \
    cd powerline-fonts/ && ./install.sh

RUN apt install -y wget && \
    apt install -y tmux


USER roger
