#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias lll='ls -l --color=auto | more'

alias grep='grep --color=auto'

alias emacs='emacs -nw'
alias pacman='pacman-color'

complete -cf sudo
complete -cf man

PS1='[\u@\h \W]\$ '

export EDITOR='emacs -nw'

#############################
# Gestion History ###########
# write .bash_history instantly, not when logging out
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# save multi line commands as one line
shopt -s cmdhist

# append, don't overwrite
shopt -s histappend

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups

# Ignore some instructions
export HISTIGNORE="ls *:ps *:pwd:clear:[bf]g:exit:du|who:vim *.bash_history"

export HISTSIZE=50000
export HISTFILESIZE=50000

# Fin Gestion History ###########
#################################

alias mysqls='sudo /etc/rc.d/mysqld' #mysqls start/stop/restart starts/stops/restarts mysql
alias apache='sudo /etc/rc.d/httpd' #apache start/stop/restart starts/stops/restarts apache

alias cdpyo='cd /usr/lib/python2.7/site-packages/pyolib'
alias wnppyo='cd /home/scl/ProgProj/Python/pyo'
