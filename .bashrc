#
# ~/.bashrc
#
echo "
    _____                  .__     .__   .__                         
   /  _  \ _______   ____  |  |__  |  |  |__|  ____   __ __ ___  ___ 
  /  /_\  \\\_  __ \_/ ___\ |  |  \ |  |  |  | /    \ |  |  \\\  \/  / 
 /    |    \|  | \/\  \___ |   Y  \|  |__|  ||   |  \|  |  / /    \  
 \____|__  /|__|    \___  /|___|  /|____/|__||___|  /|____/ /__/\_ \ 
         \/             \/      \/                \/              \/ 
"
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
alias systemctl='sudo systemctl'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

complete -cf sudo
complete -cf man

export EDITOR='emacs -nw'
PATH="${PATH}:/root/.gem/ruby/1.9.1/bin"

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

############
#   Work   #
alias deskfreville="rdesktop -g 1024x768 -P -z -a 16 -x b -r sound:off -u s.chailloux 192.168.250.22:3389"
# OpenErp Alias
alias oetail="sudo journalctl -u openerp-server.service -f | cut -d' ' -f8-"
alias oerestart='sudo systemctl restart openerp-server.service'
alias cdaddons='cd /usr/lib/python2.7/site-packages/openerp/addons/'
alias cdvp='cd /data/vp/dev/'
# End Work #
############

# Tips #######################################
# search lost file in all pkg : pacman -Qkq  #
# list wifi-network : sudo iwlist wlan0 scan #
# put wlan0 up : sudo ip link set wlan0 up   #
##############################################
