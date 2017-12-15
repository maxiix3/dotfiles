Maxiix3 does Dotfiles
========

This is my dotfiles from my archsetup, my first linux setup started november 2014 and still updating with different programs ect.

# managing
i manage mine with [gnu stow](http://www.gnu.org/software/stow/), a free, portable, lightweight symlink farm manager. this allows me to keep a versioned directory of all my config files that are virtually linked into place via a single command. this makes sharing these files among many users (root) and computers super simple. and does not clutter your home directory with version control files.


# how it works
by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/dotfiles`. and all stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

I like to have my dotfiles in ´~/projects/dotfiles´ with a symlink to ´~/dotfiles´. I have to use ´stow -d ~/dotfiles <foldername>´ to make the stow command place the symlinks right.

To install most of my configs you execute the stow command with the folder name as the only argument. 

To install my zsh conifig

```
stow zsh
```

this will symlink files to ´`~/.´` and various other places.

Components
------------

[i3](https://github.com/i3/i3)  - a dynamic tilling window manager  
[i3blocks](https://github.com/vivien/i3blocks)  - currently my statusbar  
[i3pystatus](https://github.com/enkore/i3pystatus)  - my old statusbar  
Bash - command line shell  
Feh - Lightweight image viewer  
[ranger](https://github.com/hut/ranger)  - vim inspired text-baded file manger from terminal  
[Irssi](https://github.com/irssi/irssi) - irc client  
[Redshift](https://github.com/jonls/redshift) - a f.lux inspired screen color temperature adjustment program  
URxvt  - my terminal  
Vim  - terminal text editor  
[NeoVim](https://github.com/neovim/neovim) - Vim-Fork text edtior with more advanced options  
[NeoMutt](https://www.neomutt.org)The NeoMutt project aims to bring together all the patches for Mutt. It adds a large set of features. Lots of old Mutt patches have been brought up-to-date, tidied and documented.
Zsh/[oh my zsh](https://github.com/robbyrussell/oh-my-zsh)  - a powerfull shell with Oh my zsh extension  


