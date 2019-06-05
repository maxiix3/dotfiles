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
  --timepos="x+90:h-60" \
  --datepos="tx+24:ty+25" \
  --clock --datestr "Type password to unlock..." \
  --insidecolor=00000000 --ringcolor=ffffffff --line-uses-inside \
  --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
  --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
  --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+250:h-60" \
  --radius=20 --ring-width=3 --veriftext="" --wrongtext="" \
  --timecolor="ffffffff" --datecolor="ffffffff" -n &

sleep 1
rm $TMPBG

# Pauses music if played
#playerctl pause

# If still locked after 10000ms, turn off screen
while [[ $(pgrep i3lock) ]]; do
  [[ $timeout -lt $(xssstate -i) ]] && xset dpms force off
done
