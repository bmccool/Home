#! /bin/bash

# install appropriate tools
apt install git vim-gui-common vim-runtime -y

git init
git remote add origin https://github.com/bmccool/home.git
git fetch --all
git reset --hard origin/master

