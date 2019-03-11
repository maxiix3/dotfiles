let g:gruvbox_italix=1
colorscheme gruvbox
"colorscheme jellybeans         " backup colorscheme
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax on
endif

set autochdir                   " cd to dir of current file
set autoindent                  " indenting
set autoread                    " automatically re-read when file is changed
set background=dark             " make the background grey
set backspace=indent,eol,start  " smart backspacing
set backupdir=~/.vim/backup     " directory for backups
set cindent                     " indenting // don't know the differens
set clipboard=unnamedplus       " use unix clipboard insted of the vim local clipboard
set colorcolumn=80,100,120      " Highlight right margins. 100 is the new 80
set cpoptions=aABceFsq          " compatibility options, rtfm
set directory=~/.vim/tmp        " directory for swapfiles
set expandtab                   " convert tabs to spaces
set fileformat=unix             " ------ '' ------
set fileformats=unix,dos        " LF all the way, baby
set foldmethod=indent           " make classes and other things folded
set foldlevel=99                " Fold level
set history=50                  " remember 50 commands
set hlsearch                    " highlight search
set ignorecase                  " case insensitive
set inccommand=nosplit          " subtitute "live" wile typing
set incsearch                   " search while typing
set infercase                   " case inferred
set laststatus=2                " if == 2, use status bar
set lazyredraw                  " lazy screen redraw (faster)
set linespace=0                 " no extra space between lines
set list                        " show chars indicated by listchars
set listchars=tab:>·,trail:·    " show tabs and trailing whitespace
set magic                       " use default escaping of search chars
set matchpairs=(:),{:},[:],<:>  " matching pairs for use with % (see matchit)
set matchtime=2                 " tenths of a second to show matching brackets
set mouse=a                     " enable mouse
set nobackup                    " don't make backup
set nocompatible                " Disable vi-compatibility, vim is vi improved for a reason
set nocopyindent                " follow previous indent level
set noerrorbells                " no noise, please
set noexrc                      " use local version of .(g)vimrc, .exrc
set novisualbell                " blink on error
set nowrap                      " wrap text around
set number                      " line numbers
set report=0                    " report changes via :...
set ruler                       " status bar row/col and percentage
set scrolloff=5                 " scroll at this distance from top/bottom
set shiftwidth=4                " used with autoindenting
set showcmd                     " show current command
set showmatch                   " show matching parenthesis
set showmode                    " show current mode (insert etc.)
set sidescrolloff=5             " scroll at this distance from left/right (?)
set smartcase                   " ignore case except when.. uh, :help smartcase
set smartindent                 " indenting
set smarttab                    " indenting
set softtabstop=4               " insert four spaces when I hit tab
set splitright                  " new split windows appear on the right
set startofline                 " automatically move cursor to start of line
set swapfile                    " swapfiles
set t_Co=256                    " adds 256 color support
set tabstop=2                   " an actual tab is two spaces
set wildignore=.dll,.o,.obj,.bak,.exe,.pyc,.jpg,.gif,.png,.wmv,.pdf,.avi,.mpg,.divx,.so,.a
set wildmenu                    " command line completion wild style
set wildmode=list:longest
set wildmode=longest:full,full
set wmh=0                       " window minimum height is 0, rather than 1 line

" Unused:
"set backup                      " backup
"set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:- something to do with foldable
"set nocursorcolumn              " highlight current column
"set nocursorline                " underline the current line
"set t_AB=^[[48;5;%dm            " adds 256 color support   Don't needed
"set t_AF=^[[38;5;%dm            " adds 256 color support   Don't needed
"set textwidth=79                " generate newline at col 79
"
" Paste:
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Linebreak:
set linebreak
if exists('+breakindent')
	set breakindent
	set showbreak=↳
	set wrap
endif

" who needs caps lock ?
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
