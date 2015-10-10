xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap no
exec $1

# hides the mouse when not used
unclutter &

# loads Xresources
xrdb ~/.Xresources
# because I dont have a desktop envirment
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
