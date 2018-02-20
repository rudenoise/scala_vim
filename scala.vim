let g:syntastic_scala_checkers = ['ensime']

autocmd BufWritePost *.scala silent :EnTypeCheck
