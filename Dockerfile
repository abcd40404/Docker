FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN useradd -m -s /bin/bash roger && \
    usermod -aG sudo roger && \
    echo 'roger:roger' | chpasswd


RUN apt update
    
RUN apt install -y python-dev python-pip

RUN apt install -y vim git curl wget ssh tmux htop


USER roger
WORKDIR /home/roger

ADD https://raw.githubusercontent.com/abcd40404/Docker/master/.vimrc /home/roger
USER root
RUN sudo chmod 664 .vimrc
USER roger
RUN git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/ && \
    git clone https://github.com/chriskempson/tomorrow-theme.git ~./.vim/bundle/ && \
    mkdir .fonts/ && cd .fonts/ && \
    git clone https://github.com/Lokaltog/powerline-fonts.git && \
    cd powerline-fonts/ && ./install.sh

RUN pip install --user powerline-statup install --user powerline-status
RUN cd ~ && echo 'POWERLINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh \
            if [ -f $POWERLINE_SCRIPT ]; then \
                source $POWERLINE_SCRIPT \
            fi' >> .bashrc 
