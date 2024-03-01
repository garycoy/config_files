#!/bin/sh

# run as user1
#

xrandr --output DP1-2 --mode 3840x1080

crontab /home/user1/crontab.out

~/scripts/virtual_screens_setup.sh
sleep 7 

## from : https://forum.endeavouros.com/t/oh-my-zsh-does-not-work/1965/7"
sudo pacman -Rs grml-zsh-config
rm -f ~/.zshrc
rm -fR ~/.oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp sav_zshrc ~/.zshrc

sudo pkill gpg-agent
. .~/scripts/gpg-agent-prep-launch.sh
