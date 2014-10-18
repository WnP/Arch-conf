# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/

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
alias quit='kill $(ps ax|grep evilwm|grep -v grep|cut -d " " -f 2 )'
#alias us='setxkbmap us -option compose:ralt'
alias us='env LANG=en_US.UTF-8'
alias ctrlcaps='setxkbmap -option ctrl:nocaps 2>/dev/null'


export EDITOR='vim'
export PATH=$PATH:/home/scl/.gem/ruby/2.0.0/bin:/home/scl/.cabal/bin
#export GEM_HOME=~/.gem/ruby/2.0.0

MAIL=/var/spool/mail/scl && export MAIL

# Tips #######################################
#                                            #
# search lost file in all pkg : pacman -Qkq  #
# list wifi-network : sudo iwlist wlan0 scan #
# put wlan0 up : sudo ip link set wlan0 up   #
# alsamixer CLI : amixer -c 0 set PCM 2dB+   #
#                                            #
##############################################
