#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

TERM=xterm-256color

alias ls='ls -l --color=auto'
alias logisim='java -jar ~/Documents/logisim-generic-2.7.1.jar &'
alias sshuio='ssh -YC maximinh@vor.ifi.uio.no'
alias date='while true; do date; echo -ne "\033[1F"; sleep 1; done'
alias ORMlite='wine ~/Desktop/ORMlite/ORMlite/ORMlite.exe &'
alias ormlite='wine ~/Desktop/ORMlite/ORMlite/ORMlite.exe &'
alias Ormlite='wine ~/Desktop/ORMlite/ORMlite/ORMlite.exe &'

export EDITOR="vim"
export BROWSER="google-chrome-stable"


# Sets the Mail Environment Variable
MAIL=/var/spool/mail/maximiliano && export MAIL


ulimit -c unlimited
#######################################################################
################# BASH PROPMT CUSTOMIZATION ###########################
#######################################################################

################# PS1 ##############

# PS1='[\u@\h \W]\$ // makes the default bash look
#export PS1="[\u@\h \w]\[$(tput sgr0)\]" // the same, just with whole directory
# red and yellow colors
#PS1="\[$(tput bold)\]\[$(tput setaf 7)\][\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 1)\]\w\[$(tput setaf 7)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#return value visualisation
PS1="\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;33m\] \w \$\[\033[00m\] "


############ FORTUNE ####################
#fortune quotes!
#[[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune)\e[00m"

#cow saying fortune quotes!
#[[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune -a| /usr/bin/cowsay -n)\e[00m"

# using all figures from cowsay with fortune 
#[[ "$PS1" ]] && /usr/bin/fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(/usr/bin/cowsay -l | tail -n +2)) -n

# ponysay with fortune
[[ "$PS1" ]] && /usr/bin/fortune -a | /usr/bin/ponysay

#command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n


################# news feed ##################################
# aftenposten feed, all of them
#if [ "$PS1" ] && [[ $(ping -c1 www.google.com 2>&-) ]]; then
#     The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
#    echo -e "$(echo $(curl --silent http://www.aftenposten.no/rss/ | sed -e ':a;N;$!ba;s/\n/ /g') | \
#        sed -e 's/&amp;/\&/g
#        s/&lt;\|&#60;/</g
#        s/&gt;\|&#62;/>/g
#        s/<\/a>/£/g
#        s/href\=\"/§/g
#        s/<title>/\\n\\n\\n   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
#        s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g
#        s/<description>/\\n\\n\\e[00;37m/g; s/<\/description>/\\e[00m\\n\\n/g
#        s/<p\( [^>]*\)\?>\|<br\s*\/\?>/\n/g
#        s/<b\( [^>]*\)\?>\|<strong\( [^>]*\)\?>/\\e[01;30m/g; s/<\/b>\|<\/strong>/\\e[00;37m/g
#        s/<i\( [^>]*\)\?>\|<em\( [^>]*\)\?>/\\e[41;37m/g; s/<\/i>\|<\/em>/\\e[00;37m/g
#        s/<u\( [^>]*\)\?>/\\e[4;37m/g; s/<\/u>/\\e[00;37m/g
#        s/<code\( [^>]*\)\?>/\\e[00m/g; s/<\/code>/\\e[00;37m/g
#        s/<a[^§|t]*§\([^\"]*\)\"[^>]*>\([^£]*\)[^£]*£/\\e[01;31m\2\\e[00;37m \\e[01;34m[\\e[00;37m \\e[04m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g
#        s/<li\( [^>]*\)\?>/\n \\e[01;34m*\\e[00;37m /g
#        s/<!\[CDATA\[\|\]\]>//g
#        s/\|>\s*<//g
#        s/ *<[^>]\+> */ /g
#        s/[<>£§]//g')\n\n";
#    fi

# aftenposten latest news
#if [ "$PS1" ] && [[ $(ping -c1 www.google.com 2>&-) ]]; then
#    # The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
#    echo -e "$(echo $(curl --silent http://www.aftenposten.no/rss/  | awk ' NR == 1 {while ($0 !~ /<\/item>/) {print;getline} sub(/<\/item>.*/,"</item>") ;print}' | sed -e ':a;N;$!ba;s/\n/ /g') | \
#        sed -e 's/&amp;/\&/g
#        s/&lt;\|&#60;/</g
#        s/&gt;\|&#62;/>/g
#        s/<\/a>/£/g
#        s/href\=\"/§/g
#        s/<title>/\\n\\n\\n   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
#        s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g/
#        s/<description>/\\n\\n\\e[00;37m/g; s/<\/description>/\\e[00m\\n\\n/g
#        s/<p\( [^>]*\)\?>\|<br\s*\/\?>/\n/g
#        s/<b\( [^>]*\)\?>\|<strong\( [^>]*\)\?>/\\e[01;30m/g; s/<\/b>\|<\/strong>/\\e[00;37m/g
#        s/<i\( [^>]*\)\?>\|<em\( [^>]*\)\?>/\\e[41;37m/g; s/<\/i>\|<\/em>/\\e[00;37m/g
#        s/<u\( [^>]*\)\?>/\\e[4;37m/g; s/<\/u>/\\e[00;37m/g
#        s/<code\( [^>]*\)\?>/\\e[00m/g; s/<\/code>/\\e[00;37m/g
#        s/<a[^§|t]*§\([^\"]*\)\"[^>]*>\([^£]*\)[^£]*£/\\e[01;31m\2\\e[00;37m \\e[01;34m[\\e[00;37m \\e[04m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g
#        s/<li\( [^>]*\)\?>/\n \\e[01;34m*\\e[00;37m /g
#        s/<!\[CDATA\[\|\]\]>//g
#        s/\|>\s*<//g
#        s/ *<[^>]\+> */ /g
#        s/[<>£§]//g')\n\n";
#fi

#aftenposten news, just minilised
if [ "$PS1" ] && [[ $(ping -c1 www.google.com 2>&-) ]]; then
    # The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
    echo -e "$(echo $(curl --silent http://www.aftenposten.no/rss/  | awk ' NR == 1 {while ($0 !~ /<\/item>/) {print;getline} sub(/<\/item>.*/,"</item>") ;print}' | sed -e ':a;N;$!ba;s/\n/ /g') | \
        sed -e 's/&amp;/\&/g
        s/&lt;\|&#60;/</g
        s/&gt;\|&#62;/>/g
        s/<\/a>/£/g
        s/href\=\"/§/g
        s/<title>/\   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
        s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g
        s/<description>/\\\e[00;37m/g; s/<\/description>/\\e[00m\\n/g
        s/<p\( [^>]*\)\?>\|<br\s*\/\?>/\n/g
        s/<b\( [^>]*\)\?>\|<strong\( [^>]*\)\?>/\\e[01;30m/g; s/<\/b>\|<\/strong>/\\e[00;37m/g
        s/<i\( [^>]*\)\?>\|<em\( [^>]*\)\?>/\\e[41;37m/g; s/<\/i>\|<\/em>/\\e[00;37m/g
        s/<u\( [^>]*\)\?>/\\e[4;37m/g; s/<\/u>/\\e[00;37m/g
        s/<code\( [^>]*\)\?>/\\e[00m/g; s/<\/code>/\\e[00;37m/g
        s/<a[^§|t]*§\([^\"]*\)\"[^>]*>\([^£]*\)[^£]*£/\\e[01;31m\2\\e[00;37m \\e[01;34m[\\e[00;37m \\e[04m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g
        s/<li\( [^>]*\)\?>/\n \\e[01;34m*\\e[00;37m /g
        s/<!\[CDATA\[\|\]\]>//g
        s/\|>\s*<//g
        s/ *<[^>]\+> */ /g
        s/[<>£§]//g')\n\n";
fi
