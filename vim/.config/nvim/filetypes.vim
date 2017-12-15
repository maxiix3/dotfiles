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

" =========== LateX ============
function! TexFileStuff()
    let g:tex_conceal=""
    setlocal spell spelllang=nb
    set spell
    filetype plugin on
    let g:tex_flavor='latex'
    let g:Tex_DefaultTargetFormat='pdf'
    set iskeyword+=:
    set sw=2
    set textwidth=78 formatoptions+=t

    setlocal filetype=tex
    nnoremap <buffer> <F8> :w<CR>:!pdflatex %<CR>
    inoremap <buffer> <F8> <esc>:w<CR>:!pdflatex %<CR>
    nnoremap <buffer> <F9> :w<CR>:!pdflatex --shell-escape %<CR>
    inoremap <buffer> <F9> <esc>:w<CR>:!pdflatex --shell-escape %<CR>
endfunction
autocmd BufNewFile,BufRead *.tex call TexFileStuff()


" ================ MarkDown ===================
function! Mdstuff()
    nnoremap <buffer> <F8> :w<CR>:Pandoc pdf<CR>
    inoremap <buffer> <F8> <esc>:w<CR>:Pandoc pdf<CR>
    let g:pandoc#modules#disabled = ["folding"]
    let g:pandoc#command#latex_engine = "pdflatex"
    let g:pandoc#command#autoexec_on_writes = 0
    let g:pandoc#command#autoexec_command = "Pandoc pdf"
    let g:pandoc#spell#default_langs=["nb"]
    let g:pandoc#filetypes#pandoc_markdown = 0
endfunction
autocmd BufNewFile,BufRead *.md call Mdstuff()

" =================== mutt ======================
hi mailSubject ctermfg=yellow guifg=yellow
au BufNewFile,BufRead /tmp/neomutt-* set tw=72 nocindent fileencoding=utf-8 filetype=mail
autocmd BufRead /tmp/neomutt-* execute "normal /^$/+2"
"autocmd BufnewFile,BufRead mutt* normal \qes

" ================== Matlab ======================
function! MatLabstuff()
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '│'
endfunction
autocmd BufNewFile,BufRead *.m call MatLabstuff()

