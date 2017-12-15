" Vim-innstillinger for mutt
" --------------------------
" Hvis denne filen legges i ~/.vim/ftplugin bÃ¸r moderne vim-er
" takle denne uten noe ekstra innstillinger i .vimrc.
"

set spell
set spelllang=nb
set tw=79
setlocal fo+=aw

" Tip: Place the cursor in the optimal position, editing email messages.
" Author: Trondth, based on Davide Alberani
" Version: 0.1
" Date: ons aug 29 19:25:34 CEST 2012
" " Modify according to your needs and put this in your vimrc:
" au BufRead mutt* :Fip
" Hints: read the comments in the code and modify it according to your needs.

" Function used to identify where to place the cursor, editing an email.
function! FirstInPost (...) range
    let cur = a:firstline
    while cur <= a:lastline
        let str = getline(cur)
        " Found an _empty_ subject in the headers.
        " NOTE: you can put similar checks to handle other empty headers
        " like To, From, Newgroups, ...
        if str == 'Subject: '
            execute cur
            :start!
            break
        endif
        " We have reached the end of the headers.
        if str == ''
            let cur = cur + 1
            " If the first line of the body is an attribution, put
            " the cursor _after_ that line, otherwise the cursor is
            " leaved right after the headers (assuming we're writing
            " a new mail, and not editing a reply).
            " NOTE: modify the regexp to match your mail client's attribution!
            if strlen(matchstr(getline(cur), '^Hei.*')) > 0
                let cur = cur + 1
                execute cur
                :r !echo ""
                :start
            elseif strlen(matchstr(getline(cur), '^----- Forw.*')) > 0
                let cur = cur - 1
                execute cur
                :r !echo "Hei "
                :start!
            else
                execute cur
                :r !echo "Hei "
                :start!
            endif
            break
        endif
        let cur = cur + 1
    endwhile
endfunction

" Command to be called.
com! Fip :set tw=0<Bar>:%call FirstInPost()

Fip

