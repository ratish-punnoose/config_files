# .bash_profile



# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


# sysname=`uname`
# if [ $sysname != "Darwin" ]; then
#   if [ -f ~/.bash_setup ]; then
#     . ~/.bash_setup
#   fi
# fi

#if [ -x /usr/share/cdargs ]; then
#   source /usr/share/cdargs/cdargs-lib.sh
#   source /usr/share/cdargs/cdargs-bash-completion.sh
#   source /usr/share/cdargs/cdargs-alias.sh
#fi



if [ -x /usr/bin/ssh-agent ]; then
    if [ -z $SSH_AUTH_SOCK ]; then
        if [ -f ~/.agent.env ]; then
            . ~/.agent.env -s > /dev/null
 
            if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
                ssh-agent -s -t 1d > ~/.agent.env
                . ~/.agent.env > /dev/null 2>&1
            fi
        else
            ssh-agent -s -t 1d > ~/.agent.env
            . ~/.agent.env > /dev/null 2>&1
        fi
    fi

fi
