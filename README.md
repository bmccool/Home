# Home
Configs for home directory

# Instructions
#### IMPORTANT! 
#### This will overwrite .bashrc and .bash_profile!  If there are any settings in these files that need to be saved such as environment setup, copy them to .profile.
sudo bash -c "bash <(wget -qO- https://raw.githubusercontent.com/bmccool/home/master/download_home.sh)"

Or

* git init
* git remote add origin git@github.com:bmccool/home.git
*     If the above doesn't work (ssh keys not setup) try:
*     git remote add origin https://github.com/bmccool/home.git
* git fetch --all
* git reset --hard origin/master
* exit and relog
* You may need to install vim-gui-common and vim-runtime if there are errors using vim
