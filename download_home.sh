#! /bin/bash

# install appropriate tools
if [ -n "which apt" ]; then apt install git vim-gui-common vim-runtime -y
elif [ -n "which yum" ]; then yum install git vim-common vim-enhanced vim-minimal -y
else echo "FAILED TO INSTALL PACKAGE: Package manager not found."; fi

git init
git remote add origin https://github.com/bmccool/home.git
git fetch --all
git reset --hard origin/master

# Fix new/git files ownership
USER=$(stat -c '%U' .)
chown -R $USER .vim .bash_profile .bashrc .screenrc .tmux.conf .vimrc README.md download_home.sh .git
