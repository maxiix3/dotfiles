export TERM="xterm-256color"
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
# added fortune and ponysay to the top of my shell on startup
#/usr/bin/fortune -a | /usr/bin/ponysay
# added latest news from aftenposten on shell startup
#
#if [ "$PS1" ] && [[ $(ping -c1 www.google.com 2>&-) ]]; then
#    # The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
#    echo -e "$(echo $(curl --silent http://www.aftenposten.no/rss/  | awk ' NR == 1 {while ($0 !~ /<\/item>/) {print;getline} sub(/<\/item>.*/,"</item>") ;print}' | sed -e ':a;N;$!ba;s/\n/ /g') | \
#        sed -e 's/&amp;/\&/g
#        s/&lt;\|&#60;/</g
#        s/&gt;\|&#62;/>/g
#        s/<\/a>/£/g
#        s/href\=\"/§/g
#        s/<title>/\   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
#        s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g
#        s/<description>/\\\e[00;37m/g; s/<\/description>/\\e[00m\\n/g
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
# Path to your oh-my-zsh installation.
export ZSH=/home/max/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status time)

# setting context to only show user@host when not max@arch-laptop
export DEFAULT_USER=max

#set emacsmode
bindkey -e

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

#history files
SAVEHIST=0
HISTFILE=~/.zsh_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git
        python
        )

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

unsetopt share_history

# You may need to manually set your language environment

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

export EDITOR="nvim"
export BROWSER="google-chrome-stable"

# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=100
# End of lines configured by zsh-newuser-install


source $HOME/.aliases


utleie() {
    sshfs maximinh@austur.ifi.uio.no:pc/Dokumenter/Fakturagrunnlag ~/Documents/RF/utleier/fakturagrunnlag -o reconnect,modules=iconv,from_code=utf8
    sshfs maximinh@austur.ifi.uio.no:pc/Dokumenter/Ordrebekreftelse ~/Documents/RF/utleier/bekreftelse -o reconnect,modules=iconv,from_code=utf8
    sshfs maximinh@austur.ifi.uio.no:pc/Dokumenter/Pristilbud ~/Documents/RF/utleier/tilbud -o reconnect,modules=iconv,from_code=utf8
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/bin/activate.sh
function enw(){ envwrap "$@";autoenv_init; }
