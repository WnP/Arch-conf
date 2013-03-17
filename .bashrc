#
# ~/.bashrc
#
# If not running interactively, don't do anything
# [[ $- != *i* ]] && return
[ -z "$PS1" ] && return

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;94m\]┌───< \[\e[0;36m\]\u\[\e[0;94m\] >───< \[\e[0;93m\]\w\[\e[0;94m\] >\n\[\e[0;94m\]└───>\[\e[0m\] '
PS1='\[\e[0;34m\]├──\[\e[1;35m\]| \[\e[0;36m\]\u\[\e[0;34m\] \[\e[1;35m\]|\[\e[0;34m\]─\[\e[1;35m\]| \[\e[0;32m\]\w\[\e[0;34m\] \[\e[1;35m\]|\n\[\e[0;34m\] └─\[\e[1;35m\]| \[\e[1;32m\]\A\[\e[0;34m\] \[\e[1;35m\]|\[\e[0;34m\]──\[\e[1;35m\]╼ \[\e[0m\] '
# \[\e[1;36m\] '

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias lll='ls -l --color=auto | more'
alias grep='grep --color=auto -d skip'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

rel="$(lsb_release -is)"
if [[ "${rel}" == "arch" ]]; then
	alias pacman='sudo pacman-color'
	alias systemctl='sudo systemctl'
fi

complete -cf sudo
complete -cf man

export EDITOR='vim'
#PATH="${PATH}:/root/.gem/ruby/1.9.1/bin"

#############################
# Gestion History ###########
# write .bash_history instantly, not when logging out
export PROMPT_COMMAND="history -a"

# save multi line commands as one line
shopt -s cmdhist

# append, don't overwrite
shopt -s histappend

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups
# export HISTCONTROL="ignoreboth"
# Ignore some instructions
export HISTIGNORE="ls *:ps *:pwd:clear:[bf]g:exit:du|who:vim *.bash_history"

export HISTSIZE=50000
export HISTFILESIZE=50000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Fin Gestion History ###########
#################################

# Tips #######################################
# search lost file in all pkg : pacman -Qkq  #
# list wifi-network : sudo iwlist wlan0 scan #
# put wlan0 up : sudo ip link set wlan0 up   #
##############################################
