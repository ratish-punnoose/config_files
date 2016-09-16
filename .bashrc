# .bashrc


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Disable Ctrl-D
set -o ignoreeof

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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


prompt_command () {
    if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        ERRPROMPT=""
    else
        ERRPROMPT='ERR->($?) \n'
    fi
    #if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
    #    BRANCH="\$(__git_ps1 '[ %s ] ')"
    #fi
    #local GREEN="\[\033[0;32m\]"
    #local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    #local BLUE="\[\033[0;34m\]"
    #local GRAY="\[\033[0;37m\]"
    #local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[1;33;41m\]"
    # return color to Terminal setting for text color
    local DEFAULT="\[\033[0;39m\]"
    # set the titlebar to the last 2 fields of pwd
    #local TITLEBAR='\[\e]2;`pwdtail`\a'
    local RESET='\[\033[00m\]'
#    export PS1="\[${TITLEBAR}\]${CYAN}[ ${BCYAN}\u${GREEN}@${BCYAN}\
#\h${DKGRAY}(${LOAD}) ${WHITE}${TIME} ${CYAN}]${RED}$ERRPROMPT${GRAY}\
#\w\n${GREEN}${BRANCH}${DEFAULT}$ "
    export PS1="${RED}$ERRPROMPT${RESET}\
\h{\
${WHITE}\w\
${BCYAN}$(parse_git_branch)\
${RESET}}\
\!: "
}
export PROMPT_COMMAND=prompt_command


# sexy prompt
#   Purple         host    Cyan         path   reset          Brown                                reset
# '[\[\033[0;35m\]  \h  \[\033[0;36m\]   \w   \[\033[00m\]  \[\033[33m\]   $(parse_git_branch)   \[\033[00m\]]\$ '
#export PS1='[\[\033[0;35m\]\h\[\033[0;36m\] \w\[\033[00m\]\[\033[33m\]$(parse_git_branch)\[\033[00m\]]\$ '

#           White         path Light Cyan                       reset
#PS1='\h{\[\033[1;37m\]\w\[\033[1;36m\]$(parse_git_branch)\[\033[00m\]}\!: '




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
alias l.='ls -F -d .* --color=auto'
alias ll='ls -F -l --color=auto'
alias ls='ls -F --color=auto'

PATH=$PATH:/usr/sbin:/usr/local/bin:$HOME/bin
EDITOR=emacs
HISTSIZE=100
#CDPATH=.:~:~/cpp/emb

#LD_LIBRARY_PATH=/usr/local/lib
#LIBRARY_PATH=/usr/local/lib
#TCL_LIBRARY=/usr/local/ns-allinone-2.30/tcl8.4.13/library

export PATH EDITOR

# Set http_proxy in /etc/profile.d/http_proxy.sh if needed

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

# rsync -a = -rlptgoD
#            -r recursive
#            -l copy symlinks as symlinks
#            -p preserve permissions (not good for samba)
#            -t preserve modification times
#            -g preserve group
#            -o preserve owner
#            -D preserve device files 
#            --progress show progress
#            -i itemize changes
alias bkup='rsync --modify-window=3 --delete -rlt  --no-perms -n -i'
alias bkup!='rsync --modify-window=3 --delete -rlt --no-perms --progress'
