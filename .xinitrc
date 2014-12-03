# Merge X resources from ~/.Xdefaults
[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources

## set screen layout
sh ~/.screenlayout/vga.sh
## root cursor shape
#xsetroot -cursor_name left_ptr -display :0.0
#xsetroot -cursor_name left_ptr -display :0.1
## background
feh --randomize --bg-scale  ~/Documents/wall/ &
## widgets
#gdesklets &
## xbindkeys -shortcut handler- see ~/.xbindkeysrc
#xbindkeys &
## notification
dunst &
#
#exec evilwm -term urxvt -mask1 mod4

# no bell
#/usr/bin/xset b off

exec spectrwm
