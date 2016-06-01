" Required so that we can bind to enter and not be interfere with ultisnips
"imap <expr> <CR> pumvisible() ? neocomplcache#close_popup() : '<Plug>delimitMateCR'

" Insert a line between brackets when enter is pressed
let g:delimitMate_expand_cr = 2

" Insert a space between brackets when space is pressed
let g:delimitMate_expand_space = 1
