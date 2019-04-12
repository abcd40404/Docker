#!/bin/bash

img(){
    git add .
    git commit -m "Update"
    git push
}

build(){
    docker build -t abcd40404/docker:latest .
}

run(){
    docker run -it -e "TERM=xterm-256color" abcd40404/docker
}

if [ "$1" = "img" ]; then
    img
elif [ "$1" = "build" ]; then
    build
elif [ "$1" = "run" ]; then
    run
fi
