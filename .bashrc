# .bashrc


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.DIR_COLORS ]; then
    	eval `dircolors -b ~/.DIR_COLORS`
fi


#PS1=$'\h{\w}\!: '
# -----------------------------------------------------------------
# BASH PROMPT
# -----------------------------------------------------------------
parse_git_branch() {
    #git_branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' -e 's/(\(.*\))/\1/'`
    git_branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ -n "$git_branch" ]; then
        echo ".$git_branch"
    fi
}
    
# sexy prompt
#   Purple         host    Cyan         path   reset          Brown                                reset
# '[\[\033[0;35m\]  \h  \[\033[0;36m\]   \w   \[\033[00m\]  \[\033[33m\]   $(parse_git_branch)   \[\033[00m\]]\$ '
#export PS1='[\[\033[0;35m\]\h\[\033[0;36m\] \w\[\033[00m\]\[\033[33m\]$(parse_git_branch)\[\033[00m\]]\$ '

#           White         path Light Cyan                       reset
PS1='{\[\033[1;37m\]\w\[\033[1;36m\]$(parse_git_branch)\[\033[00m\]}\!: '


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



#alias px='ps aux | grep $USER'
alias rm='rm -i'
alias l.='ls -F -d .[a-zA-Z]* --color=tty'
#alias ll='ls -F -l -color=tty'
alias ls='ls -F'

PATH=$PATH:/usr/sbin:/usr/local/bin:$HOME/bin
EDITOR=emacs
HISTSIZE=100
#CDPATH=.:~:~/cpp/emb

#LD_LIBRARY_PATH=/usr/local/lib
#LIBRARY_PATH=/usr/local/lib
#TCL_LIBRARY=/usr/local/ns-allinone-2.30/tcl8.4.13/library

http_proxy=http://wwwproxy.ran.sandia.gov:80
export PATH EDITOR http_proxy



if [ -f ~/.config/.DIR_COLORS ]; then
    	eval `dircolors -b ~/.config/.DIR_COLORS`
fi


# sysname=`uname`
# if [ $sysname != "Darwin" ]; then
#   alias ls='ls -F --color=tty'
# else
#   test -r /sw/bin/init.sh && . /sw/bin/init.sh
#   alias ls='ls -F'
#   if [ -f ~/.bash_setup ]; then
#     . ~/.bash_setup
#   fi

# fi


if [ -f ~/.config/bashmarks.sh ]; then
    source ~/.config/bashmarks.sh
fi 
#s <bookmark_name> - Saves the current directory as "bookmark_name"
#g <bookmark_name> - Goes (cd) to the directory associated with "bookmark_name"
#p <bookmark_name> - Prints the directory associated with "bookmark_name"
#d <bookmark_name> - Deletes the bookmark
#l                 - Lists all available bookmarks


# Bash Directory Bookmarks
#alias m1='alias g1="cd `pwd`"'
#alias m2='alias g2="cd `pwd`"'
#alias m3='alias g3="cd `pwd`"'
#alias m4='alias g4="cd `pwd`"'
#alias m5='alias g5="cd `pwd`"'
#alias m6='alias g6="cd `pwd`"'
# alias m7='alias g7="cd `pwd`"'
# alias m8='alias g8="cd `pwd`"'
# alias m9='alias g9="cd `pwd`"'
# alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'
# alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias m"|sed "s/alias //"'
# touch ~/.bookmarks
# source ~/.bookmarks
