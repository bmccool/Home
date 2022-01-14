#! /bin/bash

# install appropriate tools
apt install git vim-gui-common vim-runtime -y

git init
git remote add origin https://github.com/bmccool/home.git
git fetch --all
git reset --hard origin/master

# Fix new/git files ownership
chown -R brendon:brendon .vim .bash_profile .bashrc .screenrc .tmux.conf .vimrc README.md download_home.sh .git
