# loads Xresources
xrdb -merge ~/.Xresources

# hides the mouse when not used
unclutter &

xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap no
exec i3
DEFAULT_SESSION=i3

#gpg-agent
envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh
