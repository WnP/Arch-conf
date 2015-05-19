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
plugins=(pass git archlinux django github history history-substring-search)

source /etc/profile
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
#alias fireflash="sudo chroot ~/arch /bin/su - scl -c `DISPLAY=:0 firefox`"


export EDITOR='vim'
#export PATH=$PATH:/sbin:/home/scl/.cabal/bin:/home/scl/bin:/home/scl/bin/seafile-cli
#export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
export WORKON_HOME=~/Envs
export GOPATH=$HOME/ProgProj/go
export PATH=$PATH:$GOPATH/bin:/usr/lib/go/bin
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH:/usr/local/bin

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

prepare_chroot() {
    CHROOT_PATH="/home/scl/$1"

    printf "* copying Xauth files\n"
    cp /home/scl/.Xauthority $CHROOT_PATH/home/scl/
    #cp /home/scl/.xauth* $CHROOT_PATH/home/scl/

    printf "* give permission to anyone to connect to the user's X server\n"
    xhost +local:

    if [ -z "$(grep $CHROOT_PATH/proc /etc/mtab)" ]; then
        printf "* mount chroot /proc\n"
        sudo mount -o bind /proc $CHROOT_PATH/proc
        sudo mount -o bind,ro,remount /proc $CHROOT_PATH/proc
    else
        printf "* chroot /proc already mounted\n"
    fi

    if [ -z "$(grep $CHROOT_PATH/sys /etc/mtab)" ]; then
        printf "* mount chroot /sys\n"
        sudo mount -o bind /sys $CHROOT_PATH/sys
        sudo mount -o bind,ro,remount /sys $CHROOT_PATH/sys
    else
        printf "* chroot /sys already mounted\n"
    fi

    if [ -z "$(grep $CHROOT_PATH/dev /etc/mtab)" ]; then
        printf "* mount chroot /dev\n"
        sudo mount -o bind /dev $CHROOT_PATH/dev
        sudo mount -o bind,ro,remount /dev $CHROOT_PATH/dev
        sudo mount -o bind /dev/pts $CHROOT_PATH/dev/pts
        sudo mount -o bind /dev/v4l $CHROOT_PATH/dev/v4l
        sudo mount -o bind /dev/snd $CHROOT_PATH/dev/snd
    else
        printf "* chroot /dev already mounted\n"
    fi

    if [ -z "$(grep $CHROOT_PATH/run /etc/mtab)" ]; then
        printf "* mount chroot /run\n"
        sudo mount -o bind /run $CHROOT_PATH/run
        sudo mount -o bind,ro,remount /run $CHROOT_PATH/run
    else
        printf "* chroot /run already mounted\n"
    fi

    if [ -z "$(grep $CHROOT_PATH/tmp /etc/mtab)" ]; then
        printf "* mount chroot /tmp\n"
        sudo mount -o bind /tmp $CHROOT_PATH/tmp
        sudo mount -o bind,ro,remount /tmp $CHROOT_PATH/tmp
    else
        printf "* chroot /tmp already mounted\n"
    fi

    printf "* copie /etc/resolv.conf\n"
    sudo cp /etc/resolv.conf $CHROOT_PATH/etc/resolv.conf
}

alias archffx="sudo chroot ~/arch /bin/su - scl -c 'DISPLAY=:0 firefox'"
TERM=xterm

PATH="/home/scl/ProgProj/android-sdk-linux/platform-tools:/usr/lib/jvm/java-1.7-openjdk/bin:/home/scl/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/scl/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/scl/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/scl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/scl/perl5"; export PERL_MM_OPT;
export ANDROID_HOME="/home/scl/ProgProj/android-sdk-linux"
export JAVA_HOME="/usr/lib/jvm/java-1.7-openjdk/jre"

export SKIP_SASS_BINARY_DOWNLOAD_FOR_CI=true
