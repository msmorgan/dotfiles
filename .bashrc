#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /etc/profile
source $HOME/.profile

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}[\u@\h \W]\$ '

alias ls='ls --color=auto'

export EDITOR=/usr/bin/vim
export PATH=$PATH:$HOME/.cabal/bin
if [ -n "$DISPLAY" ]; then
    export BROWSER=/usr/bin/luakit
fi

function sprunge() {
    curl -F 'sprunge=<-' http://sprunge.us
}
