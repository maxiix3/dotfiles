augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*            setfiletype mail
  autocmd BufRead,BufNewFile *neomutt-*         setfiletype mail

  " SQL
  autocmd BufNewFile,BufRead *.sql              setfiletype pgsql
augroup END
