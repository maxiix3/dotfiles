#!/bin/sh

MESSAGE=$(cat)

NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($2)"-"tolower($(NF-1)) $0;}}')

MAIL=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{print $NF}')

if grep -Fq "$MAIL" $HOME/.config/neomutt/aliases; then
    :
else
    echo "$NEWALIAS" >> $HOME/.config/neomutt/aliases
fi

echo "${MESSAGE}"
