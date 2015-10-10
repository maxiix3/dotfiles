set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'git://github.com/nvie/vim-flake8.git'
Plugin 'SirVer/ultisnips'
Plugin 'git://github.com/Yggdroot/indentLine.git'
Plugin 'git://github.com/scrooloose/nerdtree'
Plugin 'git://github.com/sjl/gundo.vim.git'
Plugin 'git://github.com/altercation/vim-colors-solarized'
Plugin 'git://github.com/tpope/vim-vividchalk'
Plugin 'git://github.com/Lokaltog/vim-distinguished'
Plugin 'gmarik/Vundle.vim'
Plugin 'hdima/python-syntax'
Plugin 'lervag/vim-latex'
Plugin 'honza/vim-snippets'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Plugin 'powerline/powerline'


call vundle#end()

" ===================== SET part ===========================

"set foldmethod=indent           " make classes and other things folded
"set foldnestmax=1               " set max folds.
" set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:- something to do with foldable
set t_Co=256                    " adds 256 color support
"set t_AB=^[[48;5;%dm            " adds 256 color support   Don't needed
"set t_AF=^[[38;5;%dm            " adds 256 color support   Don't needed
set autochdir                   " cd to dir of current file
set autoindent                  " indenting
set cindent                     " indenting // don't know the differens
set autoread                    " automatically re-read when file is changed
set backspace=indent,eol,start  " smart backspacing
set backup                      " backup
set backupdir=~/.vim/backup     " directory for backups
set colorcolumn=80,120          " Highlight right margins
set cpoptions=aABceFsq          " compatibility options, rtfm
set swapfile                    " swapfiles
set directory=~/.vim/tmp        " directory for swapfiles
set expandtab                   " convert tabs to spaces
set fileformats=unix,dos        " LF all the way, baby
set fileformat=unix             " ------ '' ------
set history=50                  " remember 50 commands
set hlsearch                    " highlight search
set ignorecase                  " case insensitive
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
set nocopyindent                " follow previous indent level
" set nocursorcolumn              " highlight current column
" set nocursorline                " underline the current line
set noerrorbells                " no noise, please
set noexrc                      " use local version of .(g)vimrc, .exrc
set novisualbell                " blink on error
set nowrap                      " wrap text around
set nocompatible                " Disable vi-compatibility
set number                      " line numbers
set report=0                    " report changes via :...
set ruler                       " status bar
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
set tabstop=2                   " an actual tab is two spaces
" set textwidth=79                " generate newline at col 79
set wildignore=.dll,.o,.obj,.bak,.exe,.pyc,.jpg,.gif,.png,.wmv,.pdf,.avi,.mpg,.divx,.so,.a
set wildmenu                    " command line completion wild style
set wildmode=list:longest
set wildmode=longest:full,full
set wmh=0                       " window minimum height is 0, rather than 1 line
set clipboard=unnamedplus       " use unix clipboard insted of the vim local clipboard

" ============================================================
" ======================= Costumize ==========================
" ============================================================

" set leader to space
nmap <space> <leader>

" maps the window movement 
map <c-Down> <c-w>j
map <c-Up> <c-w>k
map <c-Right> <c-w>l
map <c-Left> <c-w>h

" ToDo list and FixMe
map <leader>td <Plug>TaskList
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>
noremap <Leader>fix :noautocmd vimgrep /FIXME/j **/*.*<CR>:cw<CR>


" Paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" =============== Standard things ===============

colorscheme jellybeans
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif



set linebreak
if exists('+breakindent')
	set breakindent
	set showbreak=↳
	set wrap
endif

cnoremap w!! w !sudo tee > /dev/null %


" ====================================
" ============= plugins ==============
" ====================================

" ======== All  ==========

" NerdTree
nmap <leader>d :NERDTreeToggle<CR>

" GondoToggle - History
map <leader>g :GundoToggle<CR>

"" ** UltiSnips ** {{{*
"" ** --------- **
"" look for snippets in vim-snippets path
let g:UltiSnipsSnippetDirectories = ['vim-snippets/UltiSnips']
let g:UltiSnipsUsePythonVersion = 2
"" triggers
let g:UltiSnipsExpandTrigger = '<C-z>'
let g:UltiSnipsJumpForwardTrigger = '<C-z>'
let g:UltiSnipsJumpBackwardTrigger = '<C-x>'
let g:UltiSnipsListSnippets = '<C-s>'
"" *}}}

" TagbarToggle
nmap <leader>tg :TagbarToggle<CR>

" ======== Java ==========
" java function that only runs on java files.
" vertical line indentation and running compilator on <F5>
function! Javafiles()
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '│'
    nnoremap <buffer> <F5> :w<CR>:!javac %<CR>
    inoremap <buffer> <F5> <esc>:w<CR>:!javac %<CR>
endfunction
autocmd BufNewFile,BufRead *.java call Javafiles()

" ========== C ===============
function! Cfiles()
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '│'
    nnoremap <buffer> <F5> :w<CR>:!gcc-4.4 -Wall -g %<CR>
    inoremap <buffer> <F5> <esc>:w<CR>:!gcc-4.4 -Wall -g %<CR>
    nnoremap <buffer> <F12> :w<CR>:!./a.out<CR>
    inoremap <buffer> <F12> <esc>:w<CR>:!./a.out<CR>
endfunction
autocmd BufNewFile,BufRead *.c call Cfiles()


" ======= Python ========
function! Pythonfiles()
    " highlight everything!
    let g:python_highlight_all = 1
    " set python 2 syntax default
    let g:python_version_2 = 1
    " Python quickfix - pyflakes
    let g:pyflakes_use_quickfix = 0
    set syntax=python

    " pep8 checker, Flake8 <F8>
    let g:pep8_map='<F8>'
    nnoremap <buffer> <F12> :w<CR>:!python2 % >> %<CR>
    inoremap <buffer> <F12> <esc>:w<CR>:!python2 % >> %<CR>

    nnoremap <buffer> <F5> :w<CR>:!python2 %<CR>
    inoremap <buffer> <F5> <esc>:w<CR>:!python2 %<CR>


    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '│'
 
    " Pytest plugin
    " Execute the tests
    nmap <silent><Leader>tf <Esc>:Pytest file<CR>
    nmap <silent><Leader>tc <Esc>:Pytest class<CR>
    nmap <silent><Leader>tm <Esc>:Pytest method<CR>
    " cycle through test errors
    nmap <silent><Leader>tn <Esc>:Pytest next<CR>
    nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
    nmap <silent><Leader>te <Esc>:Pytest error<CR>

endfunction
autocmd BufnewFile,BufRead *.py call Pythonfiles()

" =========== LateX =========
autocmd BufNewFile,BufRead *.tex let g:tex_conceal=""
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=nb
autocmd BufNewFile,BufRead *.tex set spell
autocmd BufNewFile,BufRead *.tex filetype plugin on
autocmd BufNewFile,BufRead *.tex let g:tex_flavor='latex'
autocmd BufNewFile,BufRead *.tex let g:Tex_DefaultTargetFormat='pdf'
autocmd BufNewFile,BufRead *.tex set iskeyword+=:
autocmd BufNewFile,BufRead *.tex set sw=2
autocmd BufRead,BufNewFile *.txt,*.tex set textwidth=80 formatoptions+=t

"" ** tex ** {{{*
"" ** --- **
function! TexFileStuff()
    " ensure filetype is tex, not plaintex
    setlocal filetype=tex
    nnoremap <buffer> <F8> :w<CR>:!pdflatex %<CR>
    inoremap <buffer> <F8> <esc>:w<CR>:!pdflatex %<CR>
endfunction
autocmd BufNewFile,BufRead *.tex call TexFileStuff()
"" *}}}

hi mailSubject ctermfg=yellow guifg=yellow
au BufNewFile,BufRead mutt*    set tw=77 ai nocindent fileencoding=utf-8

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
