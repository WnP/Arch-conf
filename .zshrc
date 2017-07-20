# Path to your oh-my-zsh configuration.
DISABLE_AUTO_UPDATE=true
ZSH=/home/scl/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"
# ZSH_THEME="arrow"

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
plugins=(go golang pass bower git archlinux django github history history-substring-search mercurial)

# source /etc/profile
source $ZSH/oh-my-zsh.sh
# source /usr/bin/virtualenvwrapper.sh &>/dev/null

alias grep='grep --color=always -d skip'
alias emacs='sudo emacs -nw'
alias pacman='sudo pacman'
alias systemctl='sudo systemctl'
alias service='sudo service'
alias mount='sudo mount'
alias umount='sudo umount'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
# tmux:
# -2		   Force tmux to assume the terminal supports 256 colours.
# -u		   tmux attempts to guess if the terminal is likely to support
#                  UTF-8 by checking the first of the LC_ALL, LC_CTYPE and
#                  LANG environment variables to be set for the string
#                  "UTF-8".  This is not always correct: the -u flag explicâ€
#                  itly informs tmux that UTF-8 is supported.
#
#                  If the server is started from a client passed -u or where
#                  UTF-8 is detected, the utf8 and status-utf8 options are
#                  enabled in the global window and session options respecâ€
#                  tively.
alias tmux='TERM=xterm-256color tmux -2 -u'
alias ta='tmux attach-session -t '
alias mkdir='mkdir -pv'
function vim {
	PYTHONPATH=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"` /usr/bin/nvim "$@"
}
alias vi=nvim
alias svi='sudo nvim'
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
alias ctrlcaps='setxkbmap -option ctrl:swapcaps 2>/dev/null'
alias altswap='setxkbmap -option altwin:swap_alt_win 2>/dev/null'
alias compose="setxkbmap -option compose:ralt"
function laptop {
	ctrlcaps
	altswap
	compose
}
# yes, that sounds tricky but this is the way to unset xkbmap options
alias unsetxkbmap='setxkbmap -option -option'
# full screen shot
alias shotall='scrot -z -c -d 2 ~/Pictures/%Y-%m-%d-%T-screenshot.png'
alias la='ls -a'
alias sudo="LD_PRELOAD= sudo"
alias man="LD_PRELOAD= man"
# alias emerge="sudo emerge"
alias ppython="ptipython --vi"
#alias fireflash="sudo chroot ~/arch /bin/su - scl -c `DISPLAY=:0 firefox`"
alias new_sql="touch $(date +%s).sql"
funcGoBinData() {
	go-bindata -pkg $1 -o bindata.go db
}
alias sql_bindata=funcGoBinData

# hg alias
alias hgtree="hg --hidden log --graph --template '{rev}:{node|short} {branch} {desc|firstline}\n'"
function hgll {
	hg log -G -p -r "topic($1)"
}

# git aliases
alias gittree="git log --graph --oneline --decorate --all"
alias gitlog="git log --oneline --decorate"
alias gitstatus="git status --short"
alias gitcleanbranches="git branch --merged | grep -v \"\*\" | grep -v master | grep -v dev | grep -v stable | xargs -n 1 git branch -d"
alias gitll="git log --oneline --decorate --numstat"
alias gitdiffc="git diff --cached"
alias gitdiff="git diff"
function gitfix {
	git checkout master && git pull origin master && git fetch && git checkout origin/$1 && git checkout -b $1
}
function gitdeletebranch {
	git branch -D $1
	if [ -z $2 ]
	then
		git push origin --delete $1
	else
		git push $2 --delete $1
	fi
}

# Docker aliases
function dockerclean_volumes {
       for v in `docker volume ls -q`; do
              if [[ $v =~ ^(leadme-postgres|dramarts-postgres|chaahk-postgres|criminocorpus_db|criminocorpus-postgres)$ ]]; then
                     echo "preserving $v"
              else
                     docker volume rm $v
              fi
       done
}
function dockerrm {
	docker rm -v $(docker ps -a -q -f status=exited)
}

function dockerrmi {
	docker rmi $(docker images -f "dangling=true" -q)
}

alias synergy-server="/usr/bin/synergys --enable-crypto --no-daemon --config /etc/synergy/synergy.conf &>/tmp/synergy.log &"
# alias dig="/home/scl/Project/dig-color/dig-color.sh"
alias apk="sudo apk"
alias show_wifi="sudo iw dev wlan0 scan |grep SSID"
setup_wifi() {
	wpa_passphrase $1 >> /etc/wpa_supplicant/wpa_supplicant.conf
	sudo /etc/init.d/wpa_supplicant restart
	sudo /etc/init.d/networking restart
}

alias goplayground="godoc -http=:6060 -play -index"


export EDITOR='nvim'
#export PATH=$PATH:/sbin:/home/scl/.cabal/bin:/home/scl/bin:/home/scl/bin/seafile-cli
#export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
export WORKON_HOME=~/Envs
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/lib/go/bin
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.cargo/bin

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
#autoload -U compinit promptinit
#compinit
#promptinit; prompt gentoo

alias grep="/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

sppr() { curl -F 'sprunge=<-' http://sprunge.us < ${1:-/dev/stdin} ;}
TERM=xterm

# PATH="/home/scl/.cabal/bin:/home/scl/ProgProj/android-sdk-linux/platform-tools:/usr/lib/jvm/java-1.7-openjdk/bin:/home/scl/perl5/bin${PATH+:}${PATH}"; export PATH;
# PERL5LIB="/home/scl/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/scl/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/scl/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/scl/perl5"; export PERL_MM_OPT;
# export ANDROID_HOME="/home/scl/ProgProj/android-sdk-linux"
# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/jre"

# export SKIP_SASS_BINARY_DOWNLOAD_FOR_CI=true
# export PATH=$PATH:"/home/scl/.gem/ruby/2.3.0/bin"

# fix java white screen bug on dwm cf. https://wiki.archlinux.org/index.php/Dwm#Fixing_misbehaving_Java_applications
# wmname LG3D

# QT
export QT_VERSION=5.8.0
export QT_DIR=/usr/lib/qt5/bin
export QT_STUB=false
export QT_DEBUG=false
export QT_QMAKE_DIR=/usr/lib/qt5/bin
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
source /usr/bin/virtualenvwrapper.sh
