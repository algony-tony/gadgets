
export PS1='\[\e[1;34m\]\u@\h \[\e[1;32m\]\w\[\e[m\]\[\e[1;31m\]$(__git_ps1 "(%s)") \$ \[\e[0m\]'
alias ll='ls -lh --group-directories-first --color=auto'

# stop bash generating error sounds
bind 'set bell-style none'

# https://cyb.org.uk/2021/05/03/bash-productivity.html
# 1. Use HISTIGNORE to remove pointless commands from history
export HISTIGNORE='pwd:exit:fg:bg:top:clear:history:ls:uptime:df'
# 2. Don’t lose important history
shopt -s histappend
export HISTSIZE=10000

