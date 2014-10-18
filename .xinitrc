# Merge X resources from ~/.Xdefaults
[ -f $HOME/.Xdefaults ] && xrdb $HOME/.Xdefaults

# set screen layout
sh ~/.screenlayout/vga_layout.sh
# root cursor shape
xsetroot -cursor_name left_ptr -display :0.0
xsetroot -cursor_name left_ptr -display :0.1
# background
feh --randomize --bg-scale  ~/Documents/wall/ &
# xbindkeys -shortcut handler- see ~/.xbindkeysrc
xbindkeys &
# notification
dunst &

exec evilwm -term urxvt -mask1 mod4
