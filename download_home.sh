#! /bin/bash

# install appropriate tools
if [ -n "which apt" ]; then apt install git vim-gui-common vim-runtime -y
elif [ -n "which yum" ]; then yum install git vim-common vim-enhanced vim-minimal -y
else echo "FAILED TO INSTALL PACKAGE: Package manager not found."; fi

# Get user
USER=$(stat -c '%U' .)

git init
git remote add origin https://github.com/bmccool/home.git
git fetch --all
git reset --hard origin/master

# Install Font
mkdir /home/$USER/.fonts
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/ComicShannsMono.zip -O /home/$USER/.fonts/ComicShannsMono.zip
sudo chmod u+rw /home/$USER/.fonts/*
fc-cache -fv

## Install Oh my Posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

## Download the themes
mkdir /home/$USER/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /home/$USER/.poshthemes/themes.zip
unzip /home/$USER/.poshthemes/themes.zip -d /home/$USER/.poshthemes
chmod u+rw /home/$USER/.poshthemes/*.json
rm /home/$USER/.poshthemes/themes.zip

# Fix new/git files ownership
chown -R $USER .vim .bash_profile .bashrc .screenrc .tmux.conf .vimrc README.md download_home.sh .git
