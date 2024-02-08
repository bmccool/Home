#! /bin/bash

# install appropriate tools
if [ -n "which apt" ]; then apt install git vim-gui-common vim-runtime -y
elif [ -n "which yum" ]; then yum install git vim-common vim-enhanced vim-minimal -y
else echo "FAILED TO INSTALL PACKAGE: Package manager not found."; fi

# Get user
USER=$(stat -c '%U' .)
HOMEDIR=$( getent passwd $USER | cut -d: -f6 )

git init
git remote add origin https://github.com/bmccool/home.git
git fetch --all
git reset --hard origin/master

# Install Font
mkdir -p $HOMEDIR/.fonts
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/ComicShannsMono.zip -O $HOMEDIR/.fonts/ComicShannsMono.zip
sudo chmod u+rw $HOMEDIR/.fonts/*
fc-cache -fv

## Install Oh my Posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

## Download the themes
mkdir $HOMEDIR/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O $HOMEDIR/.poshthemes/themes.zip
unzip $HOMEDIR/.poshthemes/themes.zip -d $HOMEDIR/.poshthemes
chmod u+rw $HOMEDIR/.poshthemes/*.json
rm $HOMEDIR/.poshthemes/themes.zip

# Fix new/git files ownership
chown -R $USER .vim .bash_profile .bashrc .screenrc .tmux.conf .vimrc README.md download_home.sh .git
