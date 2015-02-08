# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="arrow"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux django github history history-substring-search)

source $ZSH/oh-my-zsh.sh
source /usr/bin/virtualenvwrapper.sh &>/dev/null

alias grep='grep --color=always -d skip'
alias emacs='sudo emacs -nw'
alias pacman='sudo pacman'
alias systemctl='sudo systemctl'
alias mount='sudo mount'
alias umount='sudo umount'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias tmux='TERM=xterm-256color tmux -2'
alias ta='tmux attach-session -t '
alias mkdir='mkdir -pv'
alias vi=vim
alias svi='sudo vim'
alias svi='sudo vim'
# activate a python virtualenv named venv in the current dir
alias activate='. ./venv/bin/activate'
# quit evilwm, could use ctrl-alt-backspace too
alias quit='kill $(ps ax|grep evilwm|grep -v grep|cut -d " " -f 2 )'
# show image -dir or file-
alias show='feh'
# share image on imgur
alias share='imgur'
# usefull to show program output in english
alias us='env LANG=en_US.UTF-8'
# laptop: asign control signal to caps-lock key
alias ctrlcaps='setxkbmap -option ctrl:nocaps 2>/dev/null'
# full screen shot
alias shotall='scrot -z -c -d 2 ~/Pictures/%Y-%m-%d-%T-screenshot.png'
alias la='ls -a'
alias sudo="LD_PRELOAD= sudo"
alias man="LD_PRELOAD= man"
# alias emerge="sudo emerge"
alias ppython="ptipython --vi"


export EDITOR='vim'
export PATH=$PATH:/sbin:/home/scl/.cabal/bin
export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
export WORKON_HOME=~/Envs

MAIL=/var/spool/mail/scl && export MAIL

# Tips #######################################
#                                            #
# search lost file in all pkg : pacman -Qkq  #
# list wifi-network : sudo iwlist wlan0 scan #
# put wlan0 up : sudo ip link set wlan0 up   #
# alsamixer CLI : amixer -c 0 set PCM 2dB+   #
#                                            #
##############################################

#archey3 --config=~/.config/archey3.cfg
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

alias grep="/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

sppr() { curl -F 'sprunge=<-' http://sprunge.us < ${1:-/dev/stdin} ;}
