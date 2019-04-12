FROM ubuntu:trusty
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN useradd -m -s /bin/bash roger && \
    usermod -aG sudo roger && \
    echo 'roger:roger' | chpasswd


RUN apt update
    
RUN apt install -y python-dev python-pip

RUN apt install -y vim git curl wget ssh tmux htop locate


USER roger
WORKDIR /home/roger

ADD https://raw.githubusercontent.com/abcd40404/Docker/master/.vimrc /home/roger
USER root
RUN sudo chmod 664 .vimrc
USER roger
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    git clone https://github.com/chriskempson/tomorrow-theme.git ~/.vim/bundle/tomorrow-theme && \
    mkdir .fonts/ && cd .fonts/ && \
    git clone https://github.com/Lokaltog/powerline-fonts.git && \
    cd powerline-fonts/ && ./install.sh

RUN pip install --user powerline-status
RUN cd ~ && echo \
'if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then\n \
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh\n \ 
fi' >> .bashrc
