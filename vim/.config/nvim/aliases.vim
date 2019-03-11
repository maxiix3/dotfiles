" set leader to space
nmap <space> <leader>
" not working anymore

" Retardnes: I always hit :W insted of :w
command! Q q
command! W w

" quick tab switch:
nmap <space>1 <Plug>AirlineSelectTab1
nmap <space>2 <Plug>AirlineSelectTab2
nmap <space>3 <Plug>AirlineSelectTab3
nmap <space>4 <Plug>AirlineSelectTab4
nmap <space>5 <Plug>AirlineSelectTab5
nmap <space>6 <Plug>AirlineSelectTab6
nmap <space>7 <Plug>AirlineSelectTab7
nmap <space>8 <Plug>AirlineSelectTab8
nmap <space>9 <Plug>AirlineSelectTab9
nmap <space>h <Plug>AirlineSelectPrevTab
nmap <space>l <Plug>AirlineSelectNextTab

" maps the window movement 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" escape rules
imap <nowait> jk <esc>
cmap <nowait> jk <esc>

" ToDo list and FixMe
map <leader>td <Plug>TaskList
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>
noremap <Leader>fix :noautocmd vimgrep /FIXME/j **/*.*<CR>:cw<CR>

" make you save, like if you opened vim with sudo
"cnoremap w!! w !sudo tee > /dev/null %  " Not working on neovim :(
cnoremap w!! w suda://%

" Apply rot13 to entrie file, in case you're writing somthing secret :)
map <F11> mnggVGg?'n

" \h - nohls (Remove sarch hihglights)
" \H - hls   (set search highlights)
nmap \h :nohls<Enter>
nmap \H :set hls <Enter>

" NerdTree: File tree extension
nmap <leader>d :NERDTreeToggle<CR>

" GondoToggle: Undo History tree
map <leader>g :GundoToggle<CR>


" TagbarToggle:
"nmap <leader>tg :TagbarToggle<CR>

"|" Easymotion:
"map <Leader><leader>l <Plug>(easymotion-lineforward)
"map <Leader><leader>j <Plug>(easymotion-j)
"map <Leader><leader>k <Plug>(easymotion-k)
"map <Leader><leader>h <Plug>(easymotion-linebackward)
"
"let g:EasyMotion_startofline = 0 
"
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

