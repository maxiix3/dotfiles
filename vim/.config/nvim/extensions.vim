" Plugins
call plug#begin('~/.vim/bundle')

Plug 'Yggdroot/indentLine'                  " Indentlines
Plug 'scrooloose/nerdtree'                  " File tree explorer
Plug 'sjl/gundo.vim'                        " Undo history tree
Plug 'altercation/vim-colors-solarized'     " Colorscheme
Plug 'Lokaltog/vim-distinguished'           " Colorscheme
Plug 'hdima/python-syntax'                  " extra python syntax
Plug 'bling/vim-airline'                    " Airline bottom statusbar
Plug 'airblade/vim-gitgutter'               " Leftmargin gitstatus
Plug 'morhetz/gruvbox'                      " Colorscheme
Plug 'junegunn/fzf.vim'                     " Vim extension to FZF (Fuzzyfinder)
Plug 'chrisbra/Recover.vim'                 " diff recovery file
Plug 'lambdalisue/suda.vim'                 " Workaround while :w !sudo tee.. not works 

" Ultisnips
Plug 'SirVer/ultisnips'                     " Ultisnips
Plug 'honza/vim-snippets'                   " Snippes for ultislips

" Autocomplete with Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'                   " syntax source for deocomplete
Plug 'Shougo/neco-vim'                      " vim source for deocomplete
Plug 'ujihisa/neco-look'                    " dictionary for deoplete
Plug 'zchee/deoplete-jedi'                  " python syntax for deoplete

" filetype related
Plug 'nvie/vim-flake8'                      " Pep8 checker
Plug 'daeyun/vim-matlab'
Plug 'vim-pandoc/vim-pandoc'                " pandoc extension
Plug 'vim-pandoc/vim-pandoc-syntax'         " pandoc syntax highlightning and stuff.
Plug 'exu/pgsql.vim'                        " PostgresSQL syntax
Plug 'lervag/vimtex', {'for': 'tex'}        " simple latex shortcuts
Plug 'donRaphaco/neotex', {'for': 'tex'}    " neotex
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'tweekmonster/django-plus.vim'         " Django+


""""""" Never used anyway """"""""""""""""
"Plugin 'easymotion/vim-easymotion'      
"Plugin 'haya14busa/vim-easyoperator-line'

call plug#end()


"""""""""""""" Unused and old things """"""""""""""""""
"augroup YouCompleteMe
"autocmd!
"   let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"   let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
"augroup end



function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ""
    endif
    call UltiSnips#JumpForwards()
    if g:ulti_jump_forwards_res
        return ""
    endif
    if pumvisible()
        return "\<down>\<cr>"
    endif
    return "\<tab>"
endfunction

augroup Ultisnips
    autocmd!
    au BufEnter * exec "inoremap <silent> " .
          \ g:UltiSnipsExpandTrigger .
          \ " <C-R>=g:UltiSnips_Complete()<cr>"
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsUsePythonVersion = 3
    "let g:UltiSnipsExpandTrigger = '<C-z>'
    let g:UltiSnipsJumpForwardTrigger = '<C-z>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-x>'
    let g:UltiSnipsListSnippets = '<C-s>'
augroup end

augroup Deoplete
    autocmd!
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_refresh_always = 0
    let g:deoplete#auto_complete_start_length = 2
    let g:deoplete#disable_auto_complete = 0
    let g:deoplete#tag#cache_limit_size = 10000000
    let g:necosyntax#min_keyword_length = 2
    let g:deoplete#sources = {}
    let g:deoplete#sources._ = ['tag', 'jedi', 'vim', 'github', 'member', 'buffer', 'file', 'omni', 'ultisnips']
    call deoplete#custom#source('_', 'matchers', ['matcher_head'])
    autocmd InsertLeave * pclose!
augroup end


augroup Airline
    autocmd!
    set t_Co=256
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_detect_modified = 1
    let g:airline_detect_paste = 0
    let g:airline_detect_crypt = 0
    let g:airline_detect_spell = 1
    let g:airline_detect_iminsert = 0
    let g:airline_inactive_collapse = 1
    "let g:airline_theme = 'term'
    let g:airline_powerline_fonts = 0
    let g:airline_mode_map = {
        \ '__' : '-', 'n'  : 'N', 'i'  : 'I', 'R'  : 'R', 'c'  : 'C',
        \ 'v'  : 'V', 'V'  : 'L', '' : 'B', 's'  : 's', 'S'  : 'S', }
    let g:airline_exclude_filenames = []
    let g:airline_exclude_filetypes = ["help", "term"]
    let g:airline_exclude_preview = 0
    let g:airline_skip_empty_sections = 1

    let g:airline_section_x = ""
    let g:airline_section_y = ""
    let g:airline_section_z = ""
    let g:airline_section_error = "" "airline#section#create(['neomake_error_count'])
    let g:airline_section_warning = "" "airline#section#create(['neomake_warning_count'])

    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#branch#displayed_head_limit = 10

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_splits = 1
    let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#show_tabs = 0
    let g:airline#extensions#tabline#excludes = ["term"]
    let g:airline#extensions#tabline#exclude_preview = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#show_tab_nr = 0
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tabline#buffer_nr_format = '%s:'
    let g:airline#extensions#tabline#fnamemod = ':p:.'
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#buffer_min_count = 2
    let g:airline#extensions#csv#enabled = 1
    let g:airline#extensions#csv#column_display = 'Name'
    let g:airline#extensions#virtualenv#enabled = 1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#hunks#enabled = 1
    "let g:airline_section_z = airline#section#create_right(['%l','%c'])
augroup end

augroup Vimtex
    autocmd!
    au User VimtexEventInitPost VimtexCompile
    au User VimtexEventQuit VimtexClean
    let loaded_matchit = 0
    let g:vimtex_motion_enabled = 1
    let g:vimtex_mappings_enabled = 1
    let g:vimtex_completion_enabled = 0
    let g:vimtex_text_obj_enabled = 0
    let g:tex_flavor = 'latex'
    let g:vimtex_enabled = 1
    let g:vimtex_complete_close_braces = 1
    let g:latex_view_general_viewer = 'zathura'
    let g:vimtex_quickfix_fix_paths = 1
    let g:vimtex_quickfix_mode = 0
    let g:vimtex_view_method = 'zathura'
augroup end

augroup CSV
    autocmd!
    let g:csv_no_conceal = 1
    let g:csv_highlight_column = 'n'
    hi CSVColumnEven ctermfg=2
    hi CSVColumnOdd ctermbg=1
augroup end

augroup FzF
    autocmd!
    " FZF: FuzzyFinder, replaces CtrlP
    set rtp+=~/.fzf
    nmap ; :Buffers<CR>
    nmap <leader>r :tags<CR>
    nmap <leader>f :Files<CR>
augroup end
