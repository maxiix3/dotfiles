" =================== Vundle/plugins ====================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'git://github.com/nvie/vim-flake8.git'
Plugin 'Yggdroot/indentLine.git'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-vividchalk'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'hdima/python-syntax'
Plugin 'lervag/vim-latex'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'exu/pgsql.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/deoplete.nvim'       " Deoplete 
Plugin 'Shougo/neco-syntax'         " syntax source for deocomplete
Plugin 'Shougo/neco-vim'            " vim source for deocomplete
Plugin 'ujihisa/neco-look'          " dictionary for deoplete
Plugin 'zchee/deoplete-jedi'        " python syntax for deoplete


call vundle#end()

" =============== Standard things ===============
let g:gruvbox_italix=1
colorscheme gruvbox
"colorscheme jellybeans         " backup colorscheme
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
" ==========================================================
" ===================== SET part ===========================
" ==========================================================
set autochdir                   " cd to dir of current file
set autoindent                  " indenting
set autoread                    " automatically re-read when file is changed
set background=dark             " make the background grey
set backspace=indent,eol,start  " smart backspacing
set backupdir=~/.vim/backup     " directory for backups
set cindent                     " indenting // don't know the differens
set clipboard=unnamedplus       " use unix clipboard insted of the vim local clipboard
set colorcolumn=80,120          " Highlight right margins
set cpoptions=aABceFsq          " compatibility options, rtfm
set directory=~/.vim/tmp        " directory for swapfiles
set expandtab                   " convert tabs to spaces
set fileformat=unix             " ------ '' ------
set fileformats=unix,dos        " LF all the way, baby
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
set nobackup                    " don't make backup
set nocompatible                " Disable vi-compatibility, vim is vi improved for a reason
set nocopyindent                " follow previous indent level
set noerrorbells                " no noise, please
set noexrc                      " use local version of .(g)vimrc, .exrc
set novisualbell                " blink on error
set nowrap                      " wrap text around
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
set swapfile                    " swapfiles
set t_Co=256                    " adds 256 color support
set tabstop=2                   " an actual tab is two spaces
set wildignore=.dll,.o,.obj,.bak,.exe,.pyc,.jpg,.gif,.png,.wmv,.pdf,.avi,.mpg,.divx,.so,.a
set wildmenu                    " command line completion wild style
set wildmode=list:longest
set wildmode=longest:full,full
set wmh=0                       " window minimum height is 0, rather than 1 line

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

" Unused:
"set backup                      " backup
"set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:- something to do with foldable
"set foldmethod=indent           " make classes and other things folded
"set foldnestmax=4               " set max folds.
"set nocursorcolumn              " highlight current column
"set nocursorline                " underline the current line
"set t_AB=^[[48;5;%dm            " adds 256 color support   Don't needed
"set t_AF=^[[38;5;%dm            " adds 256 color support   Don't needed
"set textwidth=79                " generate newline at col 79

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

" make you save, like if you opened vim with sudo
cnoremap w!! w !sudo tee > /dev/null %

" Apply rot13 to entrie file, in case you're writing somthing secret :)
map <F11> mnggVGg?'n

" \h - nohls (Remove sarch hihglights)
" \H - hls   (set search highlights)
nmap \h :nohls<Enter>
nmap \H :set hls <Enter>

" ====================================
" ============= plugins ==============
" ====================================

" NerdTree
nmap <leader>d :NERDTreeToggle<CR>

" GondoToggle - History
map <leader>g :GundoToggle<CR>

"" ** UltiSnips ** {{{*
"" ** --------- **
"" look for snippets in vim-snippets path
""let g:UltiSnipsSnippetDirectories = ['vim-snippets/UltiSnips']
let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/vim-snippets/UltiSnips"]
let g:UltiSnipsUsePythonVersion = 3
"" triggers
let g:UltiSnipsExpandTrigger = '<C-z>'
let g:UltiSnipsJumpForwardTrigger = '<C-z>'
let g:UltiSnipsJumpBackwardTrigger = '<C-x>'
"let g:UltiSnipsListSnippets = '<C-s>'
"" *}}}

"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python2'


let g:deoplete#enable_at_startup = 1



" TagbarToggle:
"nmap <leader>tg :TagbarToggle<CR>

" Easymotion:
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>j <Plug>(easymotion-j)
map <Leader><leader>k <Plug>(easymotion-k)
map <Leader><leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Airline:
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#hunks#enabled = 1

" ========================================================
" ================== Filetype Specific ===================
" ========================================================

" ======== Java ==========
" java function that only runs on java files.
" vertical line indentation and running compilator on <F5>
function! Javafiles()
    let g:EclimCompletionMethod = 'omnifunc'
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '│'
    "nnoremap <buffer> <F5> :w<CR>:!javac %<CR>
    "inoremap <buffer> <F5> <esc>:w<CR>:!javac %<CR>
    nnoremap <buffer> <F5> :w<CR>:ProjectBuild<CR>
    inoremap <buffer> <F5> <esc>:w<CR>:ProjectBuild<CR>
endfunction
autocmd BufNewFile,BufRead *.java call Javafiles()

" ========== C ===============
function! Cfiles()
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '│'
    let g:ycm_min_num_of_chars_for_completion =2
    "nnoremap <buffer> <F5> :w<CR>:!gcc-4.4 -Wall -g %<CR>
    "inoremap <buffer> <F5> <esc>:w<CR>:!gcc-4.4 -Wall -g %<CR>
    nnoremap <buffer> <F5> :w<CR>:!make<CR>
    inoremap <buffer> <F5> <esc>:w<CR>:!make<CR>
    nnoremap <buffer> <F12> :w<CR>:!./a.out<CR>
    inoremap <buffer> <F12> <esc>:w<CR>:!./a.out<CR>
endfunction
autocmd BufNewFile,BufRead *.c call Cfiles()


" ======= Python ========
function! Pythonfiles()
    " highlight everything!
    let g:python_highlight_all = 1
    " set python 2 syntax default
    "let g:python_version_2 = 1
    " Python quickfix - pyflakes
    let g:pyflakes_use_quickfix = 0
    set syntax=python
    "let g:ycm_python_binary_path = 'python'

    " pep8 checker, Flake8 <F8>
    let g:pep8_map='<F8>'
    nnoremap <buffer> <F12> :w<CR>:!python % >> % <CR>
    inoremap <buffer> <F12> <esc>:w<CR>:!python % >> %<CR>

    nnoremap <buffer> <F5> :w<CR>:!python %<CR>
    inoremap <buffer> <F5> <esc>:w<CR>:!python %<CR>


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
autocmd BufRead,BufNewFile *.txt,*.tex set textwidth=78 formatoptions+=t
"" ** tex ** {{{*
"" ** --- **
function! TexFileStuff()
    " ensure filetype is tex, not plaintex
    setlocal filetype=tex
    nnoremap <buffer> <F8> :w<CR>:!pdflatex %<CR>
    inoremap <buffer> <F8> <esc>:w<CR>:!pdflatex %<CR>
    nnoremap <buffer> <F9> :w<CR>:!pdflatex --shell-escape %<CR>
    inoremap <buffer> <F9> <esc>:w<CR>:!pdflatex --shell-escape %<CR>
endfunction
autocmd BufNewFile,BufRead *.tex call TexFileStuff()
"" *}}}

" =================== mutt ======================
hi mailSubject ctermfg=yellow guifg=yellow
au BufNewFile,BufRead /tmp/neomutt-* set tw=72 nocindent fileencoding=utf-8 filetype=mail
autocmd BufRead /tmp/neomutt-* execute "normal /^$/+2"
"autocmd BufnewFile,BufRead mutt* normal \qes
