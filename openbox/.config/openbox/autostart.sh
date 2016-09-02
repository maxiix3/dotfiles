## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

## Screensaver/Lock
#i3lock &

## Set keyboard settings - 250 ms delay and 25 cps
## (characters per second) repeat rate.
#xset r rate 250 25 &

## Turn on/off system beep
#xset b off &

## Panel
#gnome-panel &

## Xflux
redshift -l 59.9494 -g 10.7564 -k 4500 &

## Keyboard-layout
#(sleep 3s && setxkbmap "no") &
#(sleep 3s && setxkbmap "us") &

## Startup-terminal
urxvt

## Dropbox
# /snacks/bin/dropbox start &

## Launch conky
#(sleep 2s && /snacks/bin/conky) &
#(sleep 2s && /snacks/bin/conky -c ~/.conkyrc_panel) &

## caps lock -> ctrl
#(sleep 5 && xmodmap ~/.Xmodmap) &
