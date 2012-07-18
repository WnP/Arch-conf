#
# ~/.bashrc
#
#   _____                  .__     .__   .__                         
#  /  _  \ _______   ____  |  |__  |  |  |__|  ____   __ __ ___  ___ 
# /  /_\  \\_  __ \_/ ___\ |  |  \ |  |  |  | /    \ |  |  \\  \/  / 
#/    |    \|  | \/\  \___ |   Y  \|  |__|  ||   |  \|  |  / /    \  
#\____|__  /|__|    \___  /|___|  /|____/|__||___|  /|____/ /__/\_ \ 
#        \/             \/      \/                \/              \/ 
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

alias emacs='sudo emacs -nw'
alias pacman='sudo pacman-color'
# Tips ######################################
# search lost file in all pkg : pacman -Qkq #
#############################################

complete -cf sudo
complete -cf man

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

alias rc.d='sudo rc.d'
source /etc/bash_completion.d/rc.d

# alias tcal='cal | sed "s/^/ /;s/$/ /;s/ $(date +%e) / $(date +%e | sed '\''s/./#/g'\'') /"'
alias ..='cd ..'
alias ...='cd ../..'

alias deskfreville="rdesktop -g 1920x1080 -P -z -a 16 -x b -f -r sound:off -u opendoo 192.168.250.22:3389"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

alias oetail='sudo tail -f /var/log/user.log | sed "s/^[a-zA-Z]*\ [0-9]*\ [0-9:]*\ localhost\ //;s/OpenERP\ Server\ 6\.1-1://;s/werkzeug:127.0.0.1\ -\ -\ //"'
# sed "s/^[a-zA-Z]*\ [0-9]*\ [0-9:]*\ localhost\ OpenERP\ Server\ 6\.1-1://;s/^[a-zA-Z0-9]*://;s/^\?://;s/werkzeug:127.0.0.1\ -\ -\ //"'
alias oerestart='sudo rc.d restart openerp-server'

# OpenErp Alias
alias cdaddons='cd /usr/lib/python2.7/site-packages/openerp/addons/'
alias cdvp='cd /data/vp/dev/'
