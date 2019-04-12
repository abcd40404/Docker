FROM ubuntu:xenial
MAINTAINER abcd40404<abcd40404@gmail.com>

RUN useradd -m -s /bin/bash roger && \
    usermod -aG sudo roger && \
    echo 'roger:roger' | chpasswd
ENV LANG en_US.UTF-8
ENV LC_ALL C

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list' && apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

RUN apt update
    
RUN apt install -y python-dev python-pip

RUN apt install -y vim git curl wget ssh tmux htop locate
RUN apt install -y ros-kinetic-desktop-full && rosdep init && rosdep update

USER roger
WORKDIR /home/roger
ENV HOME /home/roger
ENV PATH "${HOME}/.local/bin:${HOME}/bin:${PATH}"
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc && /bin/bash -c "source ~/.bashrc"

ADD https://raw.githubusercontent.com/abcd40404/Docker/master/.tmux.conf /home/roger
# Setting Vim
ADD https://raw.githubusercontent.com/abcd40404/Docker/master/.vimrc /home/roger
USER root
RUN chmod 664 .vimrc .tmux.conf && \
    chown roger:roger .vimrc .tmux.conf
USER roger
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    git clone https://github.com/chriskempson/tomorrow-theme.git ~/.vim/bundle/tomorrow-theme && \
    mkdir .fonts/ && cd .fonts/ && \
    git clone https://github.com/powerline/fonts.git ./powerline-fonts && \
    cd powerline-fonts/ && ./install.sh

RUN pip install --user powerline-status
RUN cd ~ && echo \
'if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then\n\
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh\n\ 
fi' >> .bashrc

RUN mkdir Documents && cd Documents
