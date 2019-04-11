#!/bin/bash

img(){
    git add .
    git commit -m "Update"
    git push
}

if [ "$1" = "img" ]; then
    img
fi
