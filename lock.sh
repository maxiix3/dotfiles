#!/bin/bash

rectangles=" "
timeout="10000"

SR=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
for RES in $SR; do
  SRA=(${RES//[x+]/ })
  CX=$((${SRA[2]} + 25))
  CY=$((${SRA[1]} - 50))
  rectangles+="rectangle $CX,$CY $((CX+380)),$((CY-120)) "
done

TMPBG=/tmp/screen.png
scrot $TMPBG && convert $TMPBG -scale 5% -scale 2000% -draw "fill black fill-opacity 0.4 $rectangles" $TMPBG

i3lock \
  -i $TMPBG \
  --time-pos="x+90:h-60" \
  --date-pos="tx+24:ty+25" \
  --clock --date-str "Type password to unlock..." \
  --inside-color=00000000 --ring-color=ffffffff --line-uses-inside \
  --keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
  --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
  --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+250:h-60" \
  --radius=20 --ring-width=3 --verif-text="" --wrong-text="" \
  --time-color="ffffffff" --date-color="ffffffff" -n &

sleep 1
rm $TMPBG

# Pauses music if played
#playerctl pause

# If still locked after 10000ms, turn off screen
while [[ $(pgrep i3lock) ]]; do
  [[ $timeout -lt $(xssstate -i) ]] && xset dpms force off
done
