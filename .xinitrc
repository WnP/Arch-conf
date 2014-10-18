# Merge X resources from ~/.Xdefaults
[ -f $HOME/.Xdefaults ] && xrdb $HOME/.Xdefaults

# set screen layout
sh ~/.screenlayout/vga_layout.sh
# background
sh ~/.fehbg
# root cursor shape
xsetroot -cursor_name left_ptr
# lauch xbindkeys -shortcut handler see ~/.xbindkeysrc
xbindkeys &

exec evilwm -term urxvt -mask1 mod4
